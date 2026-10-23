return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    local bufferline = require "bufferline"
    local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg or "#282828"
    opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
      style_preset = {
        bufferline.style_preset.minimal,
        bufferline.style_preset.no_italic,
      },
      tab_size = 0,
      separator_style = { "", "" },
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
    opts.highlights = vim.tbl_deep_extend("force", opts.highlights or {}, {
      fill = { bg = normal_bg },
      background = { bg = normal_bg },
      indicator_selected = { fg = "#d79921" },
      offset_separator = { bg = normal_bg },
    })
    return opts
  end,
}
