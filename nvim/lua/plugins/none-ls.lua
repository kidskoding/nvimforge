-- Format Nix with alejandra on save (AstroNvim wires none-ls into format-on-save).
---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      null_ls.builtins.formatting.alejandra,
    })
  end,
}
