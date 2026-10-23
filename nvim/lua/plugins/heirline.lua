-- Drop the per-window winbar. The tabline already shows the open file, and when
-- focus moves to another split (Claude Code, a terminal, …) the inactive winbar
-- redraws the filename as a second grey bar that looks like a duplicate tab.
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.winbar = nil
    return opts
  end,
}
