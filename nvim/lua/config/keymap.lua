vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>x', vim.cmd.Ex)  --in normal mode ' '+pv = esc

-- undotree
vim.keymap.set('n', '<leader>u', '<Cmd>UndotreeToggle<CR>')

-- neotree config
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

-- neogit 
vim.keymap.set("n", "<leader>git", "<Cmd>Neogit<CR>", { noremap = true, silent = true })
