-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- features AstroNvim turns on when Neovim starts
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- turn off heavy features in very large files
      autopairs = true, -- close brackets and quotes automatically
      cmp = true, -- show completion suggestions while typing
      diagnostics = { virtual_text = true, virtual_lines = false }, -- show errors at the end of the line
      highlighturl = true, -- highlight links
      notifications = true, -- show pop-up notifications
    },
    -- how errors and warnings are shown in your code
    diagnostics = {
      virtual_text = true, -- show the message at the end of the line
      underline = true, -- underline the code with the problem
    },
    options = {
      opt = { -- editor settings, like VS Code's settings.json
        relativenumber = true, -- number lines relative to the cursor
        number = true, -- show line numbers
        spell = false, -- spell checking
        signcolumn = "yes", -- always show the column for Git and error markers
        wrap = false, -- don't wrap long lines
        cmdheight = 1, -- keep lualine visible while typing a command
      },
      g = {}, -- global variables, for plugins that read settings from vim.g
    },
    -- keyboard shortcuts, like VS Code's keybindings.json
    mappings = {
      n = { -- keys in Normal mode; the text in brackets is what you press
        -- setting a mapping to false disables it, e.g. ["<C-S>"] = false
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- pick a tab in the tab bar to close it
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
      },
    },
  },
}
