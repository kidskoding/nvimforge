require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    version = "^6", -- stay on AstroNvim 6, so updates never jump to a new major version
    import = "astronvim.plugins",
    opts = { -- AstroNvim's own options
      mapleader = " ", -- the leader key is Space, so <Leader>ff means Space f f
      maplocalleader = ",", -- a second leader key some plugins use for file-type-specific shortcuts
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil, -- keep plugins at versions tested with AstroNvim 6
      update_notifications = true, -- show a reminder about how to update pinned plugins
    },
  },
  { import = "community" }, -- lua/community.lua
  { import = "plugins" }, -- every file in lua/plugins/
} --[[@as LazySpec]], {
  install = { colorscheme = { "astrotheme", "habamax" } }, -- theme shown while plugins install for the first time
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- built-in Neovim plugins turned off because they aren't needed (Neo-tree replaces netrw)
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
