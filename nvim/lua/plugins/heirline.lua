-- Turn off AstroNvim's per-window title bar so the Claude panel doesn't stack a second bar under the tabs.
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.winbar = nil
    return opts
  end,
}
