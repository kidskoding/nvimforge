-- AstroCommunity: ready-made plugin setups, turned on with one `import` line each
-- browse everything available here: https://github.com/AstroNvim/astrocommunity

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" }, -- helps when editing these config files
  { import = "astrocommunity.bars-and-lines.lualine-nvim" }, -- the status bar

  -- languages (uncomment the languages you use!)
  -- check out all available language extension packs here: https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack
  { import = "astrocommunity.pack.python.base" }, -- Python syntax, the debugger, and a virtualenv picker
  { import = "astrocommunity.pack.python.ty" }, -- ty: type checking, go-to-definition, and hover docs
  { import = "astrocommunity.pack.python.ruff" }, -- Ruff: linting and formatting
  -- { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.rust" },

  { import = "astrocommunity.ai.claudecode-nvim" },
}

