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

-- Configs
vim.cmd("colorscheme kanagawa")

-- Language related
require("mason").setup()
vim.lsp.enable( { 'lua_ls', 'pyright', 'bashls', 'terraformls', 'jsonls', 'tflint' } )
vim.diagnostic.config( { virtual_lines = true })

-- Keybindings for plugins
vim.g.mapleader = " "
vim.keymap.set( 'n', '<leader>lf', vim.lsp.buf.format )
vim.keymap.set( 'n', '<leader>ff', ':Pick files<CR>', { desc = 'Picker search files'} )
vim.keymap.set( 'n', '<leader>fg', ':Pick grep_live<CR>', {desc = 'Picker search using grep'} )
vim.keymap.set( 'n', '<leader>h', ':Pick help<CR>', {desc = 'Picker help'} )
vim.keymap.set( 'n', '<leader>e', ':Oil<CR>', {desc = 'File explorer'} )
vim.keymap.set( 'n', '<leader>g', ':Neogit kind=auto<CR>', {desc = 'Neogit floating'} )
vim.keymap.set( 'n', '<leader>mp', ':MarkdownPreviewToggle<CR>', {desc = 'Markdown Preview Toggle'})
vim.keymap.set( 'n', '<leader>u', ':UndotreeToggle<CR>', {desc = 'UndoTree Toggle'})

-- Keybindings (Others)
vim.keymap.set( 'n', '<C-u>', '<C-u>zz')  -- scroll up and center
vim.keymap.set( 'n', '<C-d>', '<C-d>zz')  -- scroll down and center

-- Window size control
vim.keymap.set( 'n', '<M-k>', '<cmd>resize +2<CR>')  -- Increase height of pane
vim.keymap.set( 'n', '<M-j>', '<cmd>resize -2<CR>')  -- Minimize height of pane 
vim.keymap.set( 'n', '<M-h>', '<cmd>vertical resize +5<CR>')  -- Increase width of pane
vim.keymap.set( 'n', '<M-l>', '<cmd>vertical resize -5<CR>')  -- Minimize width of pane

