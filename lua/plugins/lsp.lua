return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "blink.cmp", event = "InsertEnter" },
    },
    config = function()
      local sign = function(opts)
        vim.fn.sign_define(opts.name, {
          texthl = opts.name,
          text = opts.text,
          numhl = "",
        })
      end

      sign({ name = "DiagnosticSignError", text = "" })
      sign({ name = "DiagnosticSignWarn", text = "" })
      sign({ name = "DiagnosticSignHint", text = "" })
      sign({ name = "DiagnosticSignInfo", text = "" })

      vim.diagnostic.config({
        virtual_text = {
          prefix = "",
        },
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      vim.opt.signcolumn = "auto"
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focusable = false })
        end,
      })

      require("lspconfig").clangd.setup({})
      require("lspconfig").ruff.setup({})
      require("lspconfig").pyright.setup({
        root_dir = require("lspconfig").util.root_pattern(".git"),
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              ignore = { "*" },
              -- typeCheckingMode = "off",
              -- autoSearchPaths = true,
              -- useLibraryCodeForTypes = true,
              -- diagnosticMode = "openFilesOnly",
            },
            workspaceSymbols = {
              enabled = true,
            },
          },
        },
      })
    end,
  },
}
