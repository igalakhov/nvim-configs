return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    dependencies = { "numToStr/Comment.nvim" },
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>b", group = "buffer" },
        { "<leader>bb", "<cmd>buffers<cr>", desc = "Buffers" },
        { "<leader>bf", "<cmd>lua require('fzf-lua').buffers()<cr>", desc = "Find" },
        { "<leader>bn", "<cmd>bn<cr>", desc = "Next" },
        { "<leader>bp", "<cmd>bp<cr>", desc = "Previous" },
        { "<leader>f", group = "find" },
        { "<leader>fa", "<cmd>lua require('fzf-lua').files()<cr>", desc = "Files" },
        { "<leader>ff", "<cmd>lua require('fzf-lua').git_files()<cr>", desc = "Git Files" },
        { "<leader>fr", "<cmd>lua require('fzf-lua').oldfiles()<cr>", desc = "Recent" },
        { "<leader>fs", "<cmd>lua require('fzf-lua').blines()<cr>", desc = "Document Symbols" },
        { "<leader>fS", "<cmd>lua require('fzf-lua').lsp_document_symbols()<cr>", desc = "Document Symbols" },
        { "<leader>p", group = "project" },
        { "<leader>ps", "<cmd>lua require('fzf-lua').live_grep()<cr>", desc = "search" },
        { "<leader>t", "<cmd>SFMToggle<cr>", desc = "Toggle" },
        { "<leader>g", group = "git" },
        { "<leader>gs", "<cmd>lua require('fzf-lua').git_status()<cr>", desc = "Git Status" },
        { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git Blame" },
        { "<leader>gl", "<cmd>Git log --oneline<cr>", desc = "Git Log" },
        { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff View" },
        { "<leader>gf", "<cmd>Gdiffsplit<cr>", desc = "File Diff" },
        { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
        { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diff" },
        { "<localleader>g", "go to" },
        { "<localleader>gg", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definition" },
        {
          "<localleader>gG",
          "<cmd>vsplit<cr><c-w>l<cmd>lua vim.lsp.buf.definition()<cr>",
          desc = "Definition (new split)",
        },
        {
          "<localleader>gh",
          function()
            if vim.bo.filetype == "cpp" then
              vim.cmd("ClangdSwitchSourceHeader")
            end
          end,
          desc = "Toggle source/header",
        },
        { ";", function() 
          return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)" or "<Plug>(comment_toggle_linewise_count)" 
        end, desc = "Comment line", expr = true, mode = "n" },
        { ";", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment selection", mode = "v" },
      })
    end,
  },
}
