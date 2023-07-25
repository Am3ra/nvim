return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "always",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
      },
      servers = {
        -- pylint = {},
      },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function()
        local nls = require("null-ls")
        return {
          root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
          sources = {
            nls.builtins.formatting.fish_indent,
            nls.builtins.diagnostics.fish,
            nls.builtins.formatting.stylua,
            nls.builtins.formatting.shfmt,
            -- nls.builtins.diagnostics.flake8,
            nls.builtins.formatting.yapf,
            nls.builtins.code_actions.refactoring,
            nls.builtins.diagnostics.mypy,
            nls.builtins.diagnostics.pylint,
          },
        }
      end,
    },
  },
}
