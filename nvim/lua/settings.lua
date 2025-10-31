-- Stores the plugins and packages
-- For configuration files please see configs/keymaps.lua

-- Installed packages
vim.pack.add({
	{ src = "https://github.com/rebelot/kanagawa.nvim", desc = 'colorscheme'},
	{ src = "https://github.com/nvim-tree/nvim-web-devicons", desc = 'icon pack' },
	{ src = "https://github.com/nvim-mini/mini.pick", desc = 'Picker'},
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim", desc = 'Lua line manager' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim', desc = 'async'},
	{ src = 'https://github.com/iamcco/markdown-preview.nvim', desc = 'Markdown Previewer'},
	{ src = 'https://github.com/mbbill/undotree.git', desc = 'Undo tree'},
	-- File Explorer
	{ src = "https://github.com/stevearc/oil.nvim", desc = 'File Editor'},
	-- Language Related Plugins
	{ src = "https://github.com/neovim/nvim-lspconfig", desc = 'Language Server Protocol' },
	{ src = 'https://github.com/mason-org/mason.nvim', desc = 'Language Manager' },
	{ src = 'https://github.com/tmhedberg/simpylfold', desc = 'Python Folding'},
	-- Git Plugins
	{ src = 'https://github.com/lewis6991/gitsigns.nvim', desc = 'Git integration for UI'},
	{ src = 'https://github.com/NeogitOrg/neogit', desc = 'Git workflow'},
	{ src = 'https://github.com/sindrets/diffview.nvim', desc = 'Git diffview'}
})

require('plugins.oil')
require('plugins.mini-pick')
require('plugins.lualine')
require('lsp.lua_ls')
require('configs.keymaps')

