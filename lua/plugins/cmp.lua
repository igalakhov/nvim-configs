return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "*",
    opts = {
      keymap = {
        ['<C-i>'] = { 'select_next', 'fallback' },
        ['<C-o>'] = { 'select_prev', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Esc>'] = { 'fallback' },
        ['<Up>'] = {},
        ['<Down>'] = {},
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      completion = {
        trigger = {
          prefetch_on_insert = true,
        },
        accept = {
          auto_brackets = {
            enabled = false,
          },
        },
        menu = {
          max_height = 15,
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
            treesitter = { "lsp" },
          },
          auto_show = function(ctx)
            return ctx.mode ~= "cmdline"
          end,
        },
      },
      sources = {
        default = { "lsp", "path", "buffer" },
        providers = {
          buffer = {
            min_keyword_length = 3,
            max_items = 5,
          }
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
