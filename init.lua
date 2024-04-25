vim.g.mapleader = " "
vim.g.maplocalleader = ","

require('plugins')

vim.opt.clipboard = "unnamedplus"
vim.cmd.colorscheme "catppuccin-mocha"
vim.wo.number = true
vim.wo.relativenumber = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sync_root_with_cwd = true,
	open_on_tab = true,
	update_focused_file = {
		enable = true
	},
	renderer = {
		root_folder_label = false
	}
})

require("workspaces").setup()

local telescope = require("telescope")

telescope.load_extension("workspaces")

vim.opt.termguicolors = true

require("mason").setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	}
})

require("mason-lspconfig").setup()

require("rust-tools").setup({
	server = {
		standalone = true,
		settings = {
			["rust-analyzer"] = {
				diagnostics = {
					enable = true,
					-- disabled = {"unresolved-proc-macro"},
					enableExperimental = true,
				},
				-- procMacro = { enable = false },
				checkOnSave = {
					command = "clippy"
				},
				cargos = {
					sysroot = "/Users/ig/.rustup/toolchains/nightly-x86_64-apple-darwin"
				}
			}
		}
	}
})
require 'lspconfig'.pyright.setup {}

-- SML
-- vim.g.sml_smlnj_executable = "/usr/local/smlnj/bin/sml"
-- vim.g.sml_auto_create_def_use = "always"

-- LSP Diagnostics Options Setup
local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = ''
	})
end

sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
})

vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Completion Plugin Setup
local cmp = require 'cmp'
cmp.setup({
	-- Enable LSP snippets
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		-- Add tab support
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		})
	},
	-- Installed sources:
	sources = {
		{ name = 'path' },                         -- file paths
		{ name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
		{ name = 'nvim_lsp_signature_help' },      -- display function signatures with current parameter emphasized
		{ name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
		{ name = 'buffer',                 keyword_length = 2 }, -- source current buffer
		{ name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
		{ name = 'calc' },                         -- source for math calculation
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { 'menu', 'abbr', 'kind' },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				vsnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})

vim.opt.guifont = { "FiraMono Nerd Font Propo", ":h15" }

require('nvim-web-devicons').setup()

if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0.2
	-- vim.g.neovide_buttonless = true
end

local function open_nvim_tree(data)
	-- buffer is a real file on the disk
	local real_file = vim.fn.filereadable(data.file) == 1

	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	if not real_file and not no_name then
		return
	end

	-- open the tree, find the file but don't focus it
	-- require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
	blue   = '#80a0ff',
	cyan   = '#79dac8',
	black  = '#080808',
	white  = '#c6c6c6',
	red    = '#ff5189',
	violet = '#d183e8',
	grey   = '#303030',
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.black, bg = colors.black },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

require('lualine').setup {
	options = {
		theme = bubbles_theme,
		component_separators = '|',
		-- section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = { 'NvimTree', 'alpha' },
			winbar = {},
		},
	},
	sections = {
		lualine_a = {
			{ 'mode', separator = { left = '', right = '' }, right_padding = 2 },
		},
		lualine_b = { 'filename', 'filetype' },
		lualine_x = {},
		lualine_y = { 'filetype' },
		lualine_z = {
			{ 'location', separator = { right = '' }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { 'filename' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}

local format_on_save = require("format-on-save")

local formatters = require("format-on-save.formatters")

format_on_save.setup({
	formatter_by_ft = {
		lua = formatters.lsp,
		rust = formatters.lsp,
		ypescript = formatters.prettierd,
		typescriptreact = formatters.prettierd,
	}
})

require("bufferline").setup({
	options = {
		mode = "tabs",
		separator_style = "slant",
		show_buffer_close_icons = false,
		show_close_icon = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
			}
		}
	},
})

-- Treesitter Plugin Setup
require('nvim-treesitter.configs').setup {
	ensure_installed = { "lua", "rust", "toml" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	ident = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
}

local wk = require("which-key")

wk.register({
	f = {
		name = "file",
		f = { "<cmd>Telescope find_files<cr>", "Recent" },
		r = { "<cmd>Telescope oldfiles<cr>", "Find" }

	},
	p = {
		name = "project",
		o = { "<cmd>Telescope workspaces<cr>", "Open" },
		s = { "<cmd>Telescope live_grep<cr>", "Search" }
	},
	t = {
		name = "tree",
		t = { "<cmd>NvimTreeToggle<cr>", "Toggle" }
	},
	b = {
		name = "buffer",
		b = { "<cmd>buffers<cr>", "Buffers" },
		n = { "<cmd>bn<cr>", "Next" },
		p = { "<cmd>bp<cr>", "Previous" },
		f = { "<cmd>Telescope buffers<cr>", "Find" }
	}

}, { prefix = "<leader>" })

require('Comment').setup()

-- vim.api.nvim_set_keymap("n", ":bd", "<cmd>Bdelete<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<localleader>gi", "<cmd>lua vim.lsp.buf.declaration()<CR>",
	{ noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<localleader>ht", "<cmd>lua vim.lsp.buf.hover()<CR>",
	{ noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<localleader>gg", "<cmd>lua vim.lsp.buf.definition()<CR>",
	{ noremap = false, silent = true })
vim.api.nvim_set_keymap("n", ";", "gcc", {});
vim.api.nvim_set_keymap("v", ";", "gcgv", {});

require 'lspconfig'.tsserver.setup {}
require 'lspconfig'.lua_ls.setup {}
require 'lspconfig'.bufls.setup {}

vim.fn.setenv("PATH", vim.fn.getenv("PATH") .. ":" .. "/Users/ig/misc/millet/target/release")
require 'lspconfig'.millet.setup {}

require 'nvim-treesitter.configs'.setup {
	autotag = {
		enable = true,
	}
}

require('nvim-cursorline').setup {
	cursorline = {
		enable = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	}
}

vim.g.cursorword_disable_filetypes = { "NvimTree", "Alpha" }
