-- No title bar above each window, so the Claude panel shows only one.
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.winbar = nil
    return opts
  end,
}
