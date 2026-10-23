return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  opts = {
    overrides = {
      SignColumn = { link = "Normal" },
      FoldColumn = { link = "Normal" },
      -- gruvbox only ships WhichKeyTitle; without these the popup is an empty box
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
