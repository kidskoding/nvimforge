-- Claude Code panel without a title bar. AI keys live under <Leader>a.
return {
  "coder/claudecode.nvim",
  opts = {
    terminal = {
      snacks_win_opts = {
        wo = { winbar = "" },
      },
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        -- one lowercase <Leader>a group for every AI key, instead of the pack's <Leader>A
        for _, key in ipairs { "", "c", "f", "r", "C", "m", "b", "a", "d" } do
          maps.n["<Leader>A" .. key] = false
        end
        maps.v["<Leader>A"] = false
        maps.v["<Leader>As"] = false

        maps.n["<Leader>a"] = { desc = require("astroui").get_icon("Sidekick", 1, true) .. "AI" }
        maps.v["<Leader>a"] = { desc = require("astroui").get_icon("Sidekick", 1, true) .. "AI" }
        maps.n["<Leader>aa"] = { "<Cmd>ClaudeCode<CR>", desc = "Toggle Claude" }
        maps.n["<Leader>af"] = { "<Cmd>ClaudeCodeFocus<CR>", desc = "Focus Claude" }
        maps.n["<Leader>ar"] = { "<Cmd>ClaudeCode --resume<CR>", desc = "Resume Claude session" }
        maps.n["<Leader>am"] = { "<Cmd>ClaudeCodeSelectModel<CR>", desc = "Pick Claude model" }
        maps.n["<Leader>ab"] = { "<Cmd>ClaudeCodeAdd %<CR>", desc = "Add file to Claude" }
        maps.v["<Leader>as"] = { "<Cmd>ClaudeCodeSend<CR>", desc = "Send selection to Claude" }
        maps.n["<Leader>ay"] = { "<Cmd>ClaudeCodeDiffAccept<CR>", desc = "Accept Claude's diff" }
        maps.n["<Leader>an"] = { "<Cmd>ClaudeCodeDiffDeny<CR>", desc = "Reject Claude's diff" }
      end,
    },
  },
}
