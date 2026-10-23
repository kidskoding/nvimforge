-- Hide Snacks' per-split terminal winbar ("1: *Claude Code"), which duplicates
-- AstroNvim's tabline when Claude Code opens beside a buffer.
return {
  "coder/claudecode.nvim",
  opts = {
    terminal = {
      snacks_win_opts = {
        wo = { winbar = "" },
      },
    },
  },
}
