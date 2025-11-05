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
	{ src = 'https://github.com/mbbill/undotree.git', desc = 'Undo tree'},
	{ src = 'https://github.com/tpope/vim-surround', desc = 'Surround'},
	-- Appearence
	{ src = 'https://github.com/nvim-mini/mini.indentscope', desc = 'Indent'},
	{ src = 'https://github.com/sphamba/smear-cursor.nvim', desc = 'Cursor Animation'},
	{ src = 'https://github.com/nvim-mini/mini.notify', desc = 'Notification'},
	-- Manage Marks
	{ src = 'https://github.com/chentoast/marks.nvim', desc = 'Mark Signs'},
	-- File Explorer
	{ src = 'https://github.com/stevearc/oil.nvim', desc = 'File Editor'},
	-- Language Related Plugins
	{ src = 'https://github.com/neovim/nvim-lspconfig', desc = 'Language Server Protocol' },
	{ src = 'https://github.com/mason-org/mason.nvim', desc = 'Language Manager' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim', desc = 'Language Manager lsp' },
	{ src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim', desc = 'Diagnostics'},
	{ src = 'https://github.com/mfussenegger/nvim-lint', desc = 'Linter'},
	{ src = 'https://github.com/saghen/blink.cmp', desc = 'Autocompletion'},
	{ src = 'https://github.com/nvim-mini/mini.snippets', desc = 'Snippet Manager'},
	{ src = 'https://github.com/stevearc/conform.nvim',                  desc = 'Formatter' },
	-- language specific
	{ src = 'https://github.com/tmhedberg/simpylfold', desc = 'Python Folding'},
	{ src = 'https://github.com/iamcco/markdown-preview.nvim', desc = 'Markdown Previewer'},
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
require('plugins.mini-snippets')
require('mini.indentscope').setup( { symbol = '│' } )
require('plugins.smear-cursor')
require('mini.notify').setup()
-- require('plugins.autocmds')
require('plugins.blink-cmp')
require('plugins.marks')

-- Colorscheme
vim.cmd('colorscheme kanagawa')

-- Enable the new experimental command-line features.
require('vim._extui').enable {}

-- Language related
require('lsp.luals')
require('lsp.ruff')
require('lsp.pyright')
require('plugins.diagnostics')
require('mason').setup()
vim.lsp.enable({'luals', 'pyright'})

