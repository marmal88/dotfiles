-- Configs for keymaps and bindings

-- Keybindings for plugins
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>ll', vim.lsp.buf.format, { desc = 'Format current buffer' })
vim.keymap.set('n', '<leader>w', '<CMD>w<CR>', { desc = 'Save file now' })

-- Pickers
vim.keymap.set('n', '<leader>ft', '<CMD>Pick cli<CR>', { desc = 'Picker search terminal' })
vim.keymap.set('n', '<leader>ff', '<CMD>Pick files<CR>', { desc = 'Picker search files' })
vim.keymap.set('n', '<leader>fb', '<CMD>Pick buffers<CR>', { desc = 'Picker search buffers' })
vim.keymap.set('n', '<leader>fm', '<CMD>Pick marks<CR>', { desc = 'Picker search marks' })
-- vim.keymap.set('n', '<leader>ff', '<CMD>FzfLua files<CR>', { desc = 'Fzf-lua search files' })
-- vim.keymap.set('n', '<leader>fg', '<CMD>FzfLua grep_last<CR>', { desc = 'Fzf-lua search using grep' })
-- vim.keymap.set('n', '<leader>fb', '<CMD>FzfLua buffers<CR>', { desc = 'Fzf-lua search buffers' })
-- vim.keymap.set('n', '<leader>fe', '<CMD>FzfLua oldfiles<CR>', { desc = 'Fzf-lua search everything' })
-- vim.keymap.set('n', '<leader>fm', '<CMD>FzfLua marks<CR>', { desc = 'Fzf-lua search marks' })
-- vim.keymap.set('n', '<leader>dB', '<cmd>FzfLua dap_breakpoints<CR>', { desc = 'Fzf-lua search breakpoints' })
-- vim.keymap.set('n', '<leader>h', '<CMD>FzfLua helptags<CR>', { desc = 'Picker help' })

-- Plugins shortkeys
vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'File explorer' })
vim.keymap.set('n', '<leader>gg', '<CMD>Neogit kind=auto<CR>', { desc = 'Neogit right' })
vim.keymap.set('n', '<leader>gf', '<CMD>Neogit kind=floating<CR>', { desc = 'Neogit floating' })
vim.keymap.set('n', '<leader>gl', '<CMD>LazyGit<CR>', { desc = 'Neogit floating' })
vim.keymap.set('n', '<leader>mp', '<CMD>MarkdownPreviewToggle<CR>', { desc = 'Markdown Preview Toggle' })
vim.keymap.set('n', '<leader>u', '<CMD>UndotreeToggle<CR>', { desc = 'UndoTree Toggle' })

-- Keybindings (Others)
vim.keymap.set('n', '<C-u>', '<C-u>zz') -- scroll up and center
vim.keymap.set('n', '<C-d>', '<C-d>zz') -- scroll down and center

-- Window size control
vim.keymap.set('n', '<M-k>', '<cmd>resize +2<CR>')          -- Increase height of pane
vim.keymap.set('n', '<M-j>', '<cmd>resize -2<CR>')          -- Minimize height of pane
vim.keymap.set('n', '<M-h>', '<cmd>vertical resize +5<CR>') -- Increase width of pane
vim.keymap.set('n', '<M-l>', '<cmd>vertical resize -5<CR>') -- Minimize width of pane

-- Terminal control
vim.keymap.set('n', '<leader>t', '<CMD>botright 10split | terminal<CR>') -- bottom terminal
vim.keymap.set('t', '<ESC><ESC>', '<C-\\><C-N><CMD>q<CR>')               -- Detach from terminal to Normal mode
vim.keymap.set('t', '<leader>q', '<C-\\><C-N>')                          -- Detach from terminal to Normal mode

-- Coding
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Goto Definition' })

--Diffview
vim.keymap.set('n', '<leader>dh', '<CMD>DiffviewFileHistory<CR>', { desc = 'View file history' })
vim.keymap.set('n', '<leader>dv', function()
	if next(require('diffview.lib').views) == nil then
		vim.cmd('DiffviewOpen')
	else
		vim.cmd('DiffviewClose')
	end
end, { desc = 'Toggle Diffview' })
