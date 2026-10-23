-- Extra Mason packages (community packs already pull language tools).
---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- Nix formatter (same tool as `nix fmt` / this flake)
        "alejandra",
      },
    },
  },
}
