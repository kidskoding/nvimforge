-- Status bar on catppuccin macchiato: one bar for the whole screen, a pink badge for terminal panels.
return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local C = require("catppuccin.palettes").get_palette "macchiato"
    local theme = require "lualine.themes.catppuccin-macchiato"

    theme.terminal.a.bg = C.pink
    theme.terminal.b.fg = C.pink

    return { options = { theme = theme, globalstatus = true } }
  end,
}
