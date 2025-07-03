return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      copilot_node_command = vim.g.work_node_path or "node",
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}
