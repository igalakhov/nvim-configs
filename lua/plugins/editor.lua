return {
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
        italics = false,
        disable_italic_comments = false,
      })
      vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "numToStr/Comment.nvim",
    keys = { { ";", mode = { "n", "v" } } },
    opts = {},
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "tpope/vim-sleuth",
    event = "BufReadPost",
  },
}
