-- Hide Snacks' per-split terminal winbar ("1: *Claude Code"). Pair with
-- heirline.lua (opts.winbar = nil) so the file pane doesn't keep an inactive
-- winbar that looks like a second tab when Claude Code has focus.
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
