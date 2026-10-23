return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local theme = require("lualine.themes.gruvbox_dark")
    theme.normal.a.bg = "#fabd2f" -- gruvbox yellow for Normal mode
    -- Terminal isn't in the stock gruvbox_dark theme, so it was falling back to
    -- Normal's yellow. Give it purple — unused by the other mode segments.
    theme.terminal = vim.deepcopy(theme.insert)
    theme.terminal.a.bg = "#d3869b" -- gruvbox purple
    for _, mode in pairs(theme) do
      mode.c = theme.normal.c -- same middle color in every mode
    end
    return { options = { theme = theme, globalstatus = true } }
  end,
}
