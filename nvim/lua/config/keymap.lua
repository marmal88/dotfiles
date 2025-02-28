vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>x', vim.cmd.Ex)  --in normal mode ' '+pv = esc
vim.keymap.set('x', '<leader>p', [["_dP]])    --in visual mode paste and retain register

-- undotree
vim.keymap.set('n', '<leader>u', '<Cmd>UndotreeToggle<CR>')

-- neotree config
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

-- neogit 
vim.keymap.set("n", "<leader>git", "<Cmd>Neogit<CR>", { noremap = true, silent = true })


