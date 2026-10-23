-- Dashboard splash buttons (Snacks). Drop Find Word / Bookmarks; keep Quit.
---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    local get_icon = require("astroui").get_icon

    opts.dashboard = opts.dashboard or {}
    opts.dashboard.preset = opts.dashboard.preset or {}

    -- Assign the full list, then clear any leftover stock rows Lazy may have merged in.
    opts.dashboard.preset.keys = {
      { key = "n", action = "<Leader>n", icon = get_icon("FileNew", 0, true), desc = "New File  " },
      { key = "f", action = "<Leader>ff", icon = get_icon("Search", 0, true), desc = "Find File  " },
      { key = "o", action = "<Leader>fo", icon = get_icon("DefaultFile", 0, true), desc = "Recents  " },

      { key = "s", action = "<Leader>Sl", icon = get_icon("Refresh", 0, true), desc = "Last Session  " },

      { key = "q", action = ":qa", icon = get_icon("BufferClose", 0, true), desc = "Quit  " },
    }

    for i = #opts.dashboard.preset.keys + 1, 12 do
      opts.dashboard.preset.keys[i] = nil
    end
  end,
}
