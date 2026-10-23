-- Status bar on the gruvbox theme: one bar for the whole screen, a purple badge for terminal panels.
return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local theme = require "lualine.themes.gruvbox_dark"

    theme.normal.a.bg = "#fabd2f"
    theme.normal.c.fg = "#d5c4a1"

    theme.terminal = vim.deepcopy(theme.insert)
    theme.terminal.a.bg = "#d3869b"

    for _, mode in pairs(theme) do
      mode.c = theme.normal.c
    end

    return { options = { theme = theme, globalstatus = true } }
  end,
}
