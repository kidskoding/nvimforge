-- Other AI CLIs and Copilot's next edit suggestions, also under <Leader>a.
return {
  "folke/sidekick.nvim",
  event = "VeryLazy",
  opts = {},
  specs = {
    { "AstroNvim/astroui", opts = { icons = { Sidekick = "" } } },
  },
  keys = {
    {
      "<Tab>",
      function()
        if not require("sidekick").nes_jump_or_apply() then return "<Tab>" end
      end,
      expr = true,
      desc = "Jump to or apply next edit suggestion",
    },
    {
      "<C-.>",
      function() require("sidekick.cli").toggle() end,
      mode = { "n", "x", "i", "t" },
      desc = "Toggle AI CLI",
    },
    { "<Leader>ao", function() require("sidekick.cli").select() end, desc = "Open another AI CLI" },
    {
      "<Leader>at",
      function() require("sidekick.cli").send { msg = "{this}" } end,
      mode = { "n", "x" },
      desc = "Send this to AI CLI",
    },
    {
      "<Leader>ap",
      function() require("sidekick.cli").prompt() end,
      mode = { "n", "x" },
      desc = "Pick an AI prompt",
    },
  },
}
