-- Stores the plugins and packages
-- For configuration files please see configs/keymaps.lua

-- Installed packages
vim.pack.add({
	-- Appearence
	{ src = 'https://github.com/sphamba/smear-cursor.nvim',              desc = 'Cursor Animation' },
	{ src = 'https://github.com/rebelot/kanagawa.nvim',                  desc = 'colorscheme' },
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons',            desc = 'icon pack' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter',        version = 'main' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim',                  desc = 'async' },
	{ src = 'https://github.com/tpope/vim-surround',                     desc = 'Surround' },
	-- Programming Language
	{ src = 'https://github.com/iamcco/markdown-preview.nvim',           desc = 'Markdown Previewer' },
	{ src = 'https://github.com/tmhedberg/SimpylFold',                   desc = 'Python folding' },
	{ src = 'https://github.com/fatih/vim-go',                           desc = 'Go plugin' },
	{ src = 'https://github.com/danymat/neogen',                         desc = 'Doc Strings' },
	-- Manage Marks
	{ src = 'https://github.com/chentoast/marks.nvim',                   desc = 'Mark Signs' },
	-- Utils
	{ src = 'https://github.com/nvim-lualine/lualine.nvim',              desc = 'Line manager' },
	{ src = 'https://github.com/stevearc/oil.nvim',                      desc = 'File Editor' },
	{ src = 'https://github.com/ibhagwan/fzf-lua',                       desc = 'fzf' },
	-- Language Related Plugins
	{ src = 'https://github.com/neovim/nvim-lspconfig',                  desc = 'Lsp-server-configs' },
	{ src = 'https://github.com/mason-org/mason.nvim',                   desc = 'Language Manager' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim',         desc = 'Language Manager lsp' },
	{ src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim', desc = 'Diagnostics' },
	{ src = 'https://github.com/mfussenegger/nvim-lint',                 desc = 'Linter' },
	{ src = 'https://github.com/stevearc/conform.nvim',                  desc = 'Formatter' },
	{ src = 'https://github.com/saghen/blink.cmp',                       desc = 'Autocompletion' },
	-- AI
	{ src = 'https://github.com/folke/sidekick.nvim',                    desc = 'Sidekick' },
	-- Debugger specific
	{ src = 'https://github.com/nvim-neotest/nvim-nio',                  desc = 'Snippet Manager' },
	{ src = 'https://github.com/mfussenegger/nvim-dap',                  desc = 'Debugger Adapter Protocol' },
	{ src = 'https://github.com/rcarriga/nvim-dap-ui',                   desc = 'Debugger UI' },
	{ src = 'https://github.com/mfussenegger/nvim-dap-python',           desc = 'Debugger Python' },
	-- Git Plugins
	{ src = 'https://github.com/lewis6991/gitsigns.nvim',                desc = 'Git integration for UI' },
	{ src = 'https://github.com/kdheepak/lazygit.nvim',                  desc = 'Lazygit plugin - lazygit needs to be installed' },
	{ src = 'https://github.com/NeogitOrg/neogit',                       desc = 'Git workflow' },
	{ src = 'https://github.com/sindrets/diffview.nvim',                 desc = 'Git diffview' }
})

-- Import necessary plugins
require('plugin.mini')
require('plugin.oil')
require('plugin.lualine')
require('plugin.fzf-lua')
require('plugin.smear-cursor')
require('plugin.autocmds')
require('plugin.blink-cmp')
require('plugin.marks')
require('plugin.conform')
require('plugin.neogen')
require('plugin.sidekick')

-- Language related
require('plugin.diagnostics')
require('mason').setup()
vim.lsp.enable({ 'lua_ls', 'pyright', 'ruff', 'bashls', 'terraformls', 'gopls', "jsonls", "ts_ls", "copilot" })
require('plugin.debugger')
