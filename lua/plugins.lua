return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {}
		end
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'ggandor/lightspeed.nvim'
	use {
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-llluaua/plenary.nvim" },
		opts = {}
	}
	use 'natecraddock/workspaces.nvim'
	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use 'simrat39/rust-tools.nvim'

	-- Cmpletion framework:
	use 'hrsh7th/nvim-cmp'

	-- LSP completion source:
	use 'hrsh7th/cmp-nvim-lsp'

	-- Useful completion sources:
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/vim-vsnip'

	use 'nvim-lualine/lualine.nvim'
	use 'elentok/format-on-save.nvim'

	use 'nvim-treesitter/nvim-treesitter'

	use 'voldikss/vim-floaterm'

	use 'echasnovski/mini.bufremove'
	use 'andweeb/presence.nvim'

	use 'numToStr/Comment.nvim'
	use 'stevearc/vim-arduino'
	use 'windwp/nvim-ts-autotag'
	use 'yamatsum/nvim-cursorline'
	use 'xiyaowong/nvim-cursorword'
end)
