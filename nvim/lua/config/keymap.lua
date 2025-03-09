vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>x', vim.cmd.Ex)  --in normal mode ' '+pv = esc
vim.keymap.set('x', '<leader>p', [["_dP]])    --in visual mode paste and retain register

vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- undotree
vim.keymap.set('n', '<leader>u', '<Cmd>UndotreeToggle<CR>')

-- neogit 
vim.keymap.set("n", "<leader>git", "<Cmd>Neogit<CR>", { noremap = true, silent = true })


