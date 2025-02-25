vim.g.mapleader = " "
vim.keymap.set("n", "<leader>x", vim.cmd.Ex)  --in normal mode " "+pv = esc

-- undotree
vim.keymap.set('n', '<leader>u', '<Cmd>UndotreeToggle<CR>')

-- neotree config
vim.keymap.set("n", "<leader>e", '<Cmd>Neotree toggle<CR>')

-- terminal
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("botright horizontal term")
  vim.cmd("resize 5")
end)

