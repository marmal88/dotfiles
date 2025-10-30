-- Configs
vim.cmd("colorscheme kanagawa")

-- Language related
require("mason").setup()
vim.lsp.enable( { 'lua_ls', 'pyright', 'bashls', 'terraformls', 'jsonls', 'tflint' } )

-- Language Diagnostics
vim.diagnostic.config( {
	virtual_lines = { current_line = true },
	virtual_text = false,
})

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

-- terminal close
vim.keymap.set( 't', '<leader>q', '<C-\\><C-N>')  -- Detach from terminal to Normal mode

