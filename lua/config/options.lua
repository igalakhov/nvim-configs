vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.fn.setenv("TERM", "screen-256color")
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.textwidth = 0
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.lazyredraw = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 4
vim.opt.foldlevelstart = 99

vim.opt.fillchars:append("diff: ")
vim.opt.diffopt:append("hiddenoff")