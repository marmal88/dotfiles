-- Installed packages
vim.pack.add({
	{ src = "https://github.com/rebelot/kanagawa.nvim", desc = 'colorscheme'},
	{ src = "https://github.com/nvim-tree/nvim-web-devicons", desc = 'icon pack' },
	{ src = "https://github.com/nvim-mini/mini.pick", desc = 'Picker'},
	{ src = "https://github.com/stevearc/oil.nvim", desc = 'File Explorer/Editor'},
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim", desc = 'Lua line manager' },
	-- File Explorer
	{ src = "https://github.com/stevearc/oil.nvim", desc = 'File Editor'},
	-- Language Related Plugins
	{ src = "https://github.com/neovim/nvim-lspconfig", desc = 'Language Server Protocol' },
	{ src = 'https://github.com/mason-org/mason.nvim', desc = 'Language Manager' },
	{ src = 'https://github.com/tmhedberg/simpylfold', desc = 'Python Folding'},
})

require('plugins.oil')
require('plugins.mini-pick')
require('plugins.lualine')
require('lsp.lua_ls')

-- Configs
vim.cmd("colorscheme kanagawa")

-- Language related
require("mason").setup()
vim.lsp.enable( { 'lua_ls', 'pyright', 'bashls', 'terraformls', 'jsonls', 'tflint' } )
vim.diagnostic.config( { virtual_lines = true })

-- keybindings
vim.g.mapleader = " "
vim.keymap.set( 'n', '<leader>lf', vim.lsp.buf.format )
vim.keymap.set( 'n', '<leader>ff', ':Pick files<CR>', {desc = 'Picker search'} )
vim.keymap.set( 'n', '<leader>h', ':Pick help<CR>', {desc = 'Picker help'} )
vim.keymap.set( 'n', '<leader>e', ':Oil<CR>', {desc = 'File explorer'} )

-- Keybindings (Others)
vim.keymap.set('n', '<C-u>', '<C-u>zz')  -- scroll up and center
vim.keymap.set('n', '<C-d>', '<C-d>zz')  -- scroll down and center
