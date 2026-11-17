{
  description = "nvimforge: a beginner-friendly, extensible Neovim environment built with AstroNvim";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});

    toolsFor = pkgs:
      with pkgs;
        [
          git
          gnumake
          gcc
          unzip
          ripgrep
          fd
          tree-sitter
          lazygit
          gdu
          bottom
          nodejs
          python3
          curl
          wget
          gzip
          gnutar
        ]
        ++ lib.optionals stdenv.hostPlatform.isLinux [
          wl-clipboard
          xclip
        ];

    mkLauncher = pkgs: {
      name,
      gui ? false,
      fresh ? false,
      dev ? false,
    }:
      pkgs.writeShellApplication {
        inherit name;
        runtimeInputs = toolsFor pkgs ++ [pkgs.neovim-unwrapped] ++ pkgs.lib.optional gui pkgs.neovide;
        text = ''
          APP=nvimforge
          dev=${pkgs.lib.boolToString dev}
          fresh=${pkgs.lib.boolToString fresh}
          gui=${pkgs.lib.boolToString gui}
          user_config="''${XDG_CONFIG_HOME:-$HOME/.config}"

          if $dev; then
            src="$PWD/nvim"
            if [ ! -f "$src/init.lua" ]; then
              echo "error: no nvim/init.lua in $PWD (run from the nvimforge repo root)" >&2
              exit 1
            fi
          else
            src=${./nvim}
          fi

          if $fresh; then
            root="$(mktemp -d -t nvimforge.XXXXXX)"
            trap 'rm -rf "$root"' EXIT
          else
            root="''${XDG_DATA_HOME:-$HOME/.local/share}/$APP"
          fi

          cfg="$root/config/$APP"
          mkdir -p "$root/config"
          rm -rf "$cfg"
          if $dev; then
            ln -s "$src" "$cfg"
          else
            # files copied out of the Nix store are read-only, and lazy.nvim writes lazy-lock.json here
            cp -r "$src" "$cfg"
            chmod -R u+w "$cfg"
          fi

          # XDG_CONFIG_HOME moves below, so point git at the user's own config before it does
          if [ -z "''${GIT_CONFIG_GLOBAL:-}" ] && [ ! -e "$HOME/.gitconfig" ] && [ -e "$user_config/git/config" ]; then
            export GIT_CONFIG_GLOBAL="$user_config/git/config"
          fi

          export NVIM_APPNAME="$APP"
          export XDG_CONFIG_HOME="$root/config"
          export XDG_DATA_HOME="$root/data"
          export XDG_STATE_HOME="$root/state"
          export XDG_CACHE_HOME="$root/cache"

          if $gui; then
            neovide --no-fork --neovim-bin "$(command -v nvim)" "$@"
          else
            nvim "$@"
          fi
        '';
      };
  in {
    packages = forAllSystems (
      pkgs: let
        launch = mkLauncher pkgs;
      in {
        default = launch {name = "nvimforge";};
        fresh = launch {
          name = "nvimforge-fresh";
          fresh = true;
        };
        dev = launch {
          name = "nvimforge-dev";
          dev = true;
        };
        neovide = launch {
          name = "nvimforge-neovide";
          gui = true;
        };
        neovide-fresh = launch {
          name = "nvimforge-neovide-fresh";
          gui = true;
          fresh = true;
        };
        neovide-dev = launch {
          name = "nvimforge-neovide-dev";
          gui = true;
          dev = true;
        };
      }
    );

    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        packages =
          toolsFor pkgs
          ++ [
            pkgs.neovim-unwrapped
            pkgs.nixd
            pkgs.alejandra
          ];
      };
    });

    formatter = forAllSystems (pkgs: pkgs.alejandra);
  };
}
