return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local theme = require("lualine.themes.gruvbox_dark")
    theme.normal.a.bg = "#fabd2f" -- gruvbox yellow for Normal mode
    for _, mode in pairs(theme) do
      mode.c = theme.normal.c -- same middle color in every mode
    end
    return { options = { theme = theme, globalstatus = true } }
  end,
}
