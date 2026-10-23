return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    local bufferline = require "bufferline"
    local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg or "#282828"
    local active_bg = "#3c3836"

    opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
      style_preset = {
        bufferline.style_preset.minimal,
        bufferline.style_preset.no_italic,
      },
      tab_size = 0,
      separator_style = { "", "" },
      indicator = { style = "none" },
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
        {
          filetype = "snacks_layout_box",
          separator = true,
          highlight = "Normal",
        },
      },
    })

    local highlights = {
      fill = { bg = normal_bg },
      background = { bg = normal_bg },
      offset_separator = { bg = normal_bg },
    }

    -- every piece of the active tab sits on the same raised background
    for _, part in ipairs { "indicator", "close_button", "modified", "duplicate", "numbers", "pick", "diagnostic" } do
      highlights[part .. "_selected"] = { bg = active_bg }
    end
    for _, level in ipairs { "hint", "info", "warning", "error" } do
      highlights[level .. "_selected"] = { bg = active_bg }
      highlights[level .. "_diagnostic_selected"] = { bg = active_bg }
    end
    highlights.buffer_selected = { fg = "#ebdbb2", bg = active_bg, bold = true }

    opts.highlights = vim.tbl_deep_extend("force", opts.highlights or {}, highlights)

    return opts
  end,
}
