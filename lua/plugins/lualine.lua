return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = {
          lsp = {
            auto_attach = true,
          },
        },
      },
      {
        "AndreM222/copilot-lualine",
        dependencies = { "zbirenbaum/copilot.lua" },
      },
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "everforest",
          component_separators = { left = '', right = '' },
          section_separators = { left = '▌', right = '▐' },
          disabled_filetypes = {
            statusline = { "NvimTree", "alpha", "qf" },
            winbar = {},
          },
        },
        sections = {
          lualine_a = {
            { "mode" },
          },
          lualine_b = { "filename" },
          lualine_c = { "navic" },
          lualine_x = { 
            { "copilot", show_colors = true, show_loading = true } 
          },
          lualine_y = { "filetype" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
    end,
  },
}
