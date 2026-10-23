-- Gruvbox theme: gutters match the editor background, and which-key borrows the theme's colors.
return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  opts = {
    overrides = {
      SignColumn = { link = "Normal" },
      FoldColumn = { link = "Normal" },

      -- which key overrides
      WhichKey = { link = "Function" },
      WhichKeyNormal = { link = "NormalFloat" },
      WhichKeyBorder = { link = "FloatBorder" },
      WhichKeyDesc = { link = "Identifier" },
      WhichKeyGroup = { link = "Keyword" },
      WhichKeySeparator = { link = "Comment" },
      WhichKeyValue = { link = "Comment" },
    },
  },
}
