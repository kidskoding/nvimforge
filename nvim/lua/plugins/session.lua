return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    opts.autocmds.restore_session[1].callback = function()
      if vim.fn.argc() > 0 then return end
      for _, arg in ipairs(vim.v.argv) do
        if arg == "-b" or arg == "-c" or arg == "-S" or vim.startswith(arg, "+") then return end
      end
      require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
    end
  end,
}
