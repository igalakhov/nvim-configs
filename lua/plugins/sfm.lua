return {
  {
    "dinhhuy258/sfm.nvim",
    cmd = "SFMToggle",
    opts = {
      view = {
        side = "right",
        float = {
          enable = true,
          config = {
            width = 50,
            height = function(_, _, _)
              return math.max(vim.o.lines - 3, 30)
            end,
            border = { "╭", "─", "", "", "╯", "─", "╰", "│" },
            anchor = "NE",
            row = 0,
            col = function(_, _, _)
              return vim.o.columns
            end,
          },
        },
      },
    },
  },
}
