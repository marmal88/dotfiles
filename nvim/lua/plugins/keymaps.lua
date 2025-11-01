-- Configs for keymaps and bindings

-- Keybindings for plugins
vim.g.mapleader = " "
vim.keymap.set( 'n', '<leader>lf', vim.lsp.buf.format )
vim.keymap.set( 'n', '<leader>ft', ':Pick cli<CR>', { desc = 'Picker search terminal'} )
vim.keymap.set( 'n', '<leader>ff', ':FzfLua files<CR>', { desc = 'Fzf-lua search files'} )
vim.keymap.set( 'n', '<leader>fg', ':FzfLua grep_last<CR>', {desc = 'Fzf-lua search using grep'} )
vim.keymap.set( 'n', '<leader>fb', ':FzfLua buffers<CR>', {desc = 'Fzf-lua search buffers'} )
vim.keymap.set( 'n', '<leader>fe', ':FzfLua oldfiles<CR>', {desc = 'Fzf-lua search everything'} )
vim.keymap.set( 'n', '<leader>h', ':FzfLua helptags<CR>', {desc = 'Picker help'} )
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
vim.keymap.set( 'n', '<leader>t', ':botright 10split | terminal<CR>') -- bottom terminal
vim.keymap.set( 't', '<leader>q', '<C-\\><C-N>')  -- Detach from terminal to Normal mode

