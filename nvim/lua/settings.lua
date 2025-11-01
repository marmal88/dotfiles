-- Stores the plugins and packages
-- For configuration files please see configs/keymaps.lua

-- Installed packages
vim.pack.add({
	{ src = 'https://github.com/rebelot/kanagawa.nvim', desc = 'colorscheme'},
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons', desc = 'icon pack' },
	{ src = 'https://github.com/ibhagwan/fzf-lua', desc = 'Picker fzf'},
	{ src = 'https://github.com/nvim-mini/mini.pick', desc = 'Picker mini'},
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim', desc = 'Lua line manager' },
	{ src = 'https://github.com/akinsho/bufferline.nvim', desc = 'Buffer line manager' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim', desc = 'async'},
	{ src = 'https://github.com/iamcco/markdown-preview.nvim', desc = 'Markdown Previewer'},
	{ src = 'https://github.com/mbbill/undotree.git', desc = 'Undo tree'},
	-- File Explorer
	{ src = 'https://github.com/stevearc/oil.nvim', desc = 'File Editor'},
	-- Language Related Plugins
	{ src = 'https://github.com/neovim/nvim-lspconfig', desc = 'Language Server Protocol' },
	{ src = 'https://github.com/mason-org/mason.nvim', desc = 'Language Manager' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim', desc = 'Language Manager lsp' },
	{ src = 'https://github.com/tmhedberg/simpylfold', desc = 'Python Folding'},
	{ src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim', desc = 'Diagnostics'},
	{ src = 'https://github.com/mfussenegger/nvim-lint', desc = 'Linter'},
	-- { src = 'https://github.com/stevearc/conform.nvim', desc = 'Formatter'},
	-- Git Plugins
	{ src = 'https://github.com/lewis6991/gitsigns.nvim', desc = 'Git integration for UI'},
	{ src = 'https://github.com/NeogitOrg/neogit', desc = 'Git workflow'},
	{ src = 'https://github.com/sindrets/diffview.nvim', desc = 'Git diffview'}
})

-- Import necessary plugins
require('plugins.oil')
require('plugins.lualine')
require('plugins.bufferline')
require('plugins.keymaps')
require('plugins.fzf-lua')
require('plugins.mini-pick')
require('plugins.autocmds')

-- Colorscheme
vim.cmd('colorscheme kanagawa')

-- Enable the new experimental command-line features.
require('vim._extui').enable {}

-- Language related
require('lsp.luals')
require('lsp.luacheck')
require('lsp.ruff')
require('lsp.pyright')
require('mason').setup()
vim.lsp.enable({'luals', 'pyright'})

-- Linting
require('lint').linters_by_ft = {
	lua = {'luacheck'},
	python = { 'ruff' }
}

-- Setup diagnostics
require('tiny-inline-diagnostic').setup({
	preset = 'ghost',
	options = {
		add_messages = { display_count = true },
		show_source = { enabled = true },
		multilines = { enabled = true },
	},
	blend = { factor = 0.2 },
})

