local snippets = require('mini.snippets')
return require('mini.snippets').setup({
  snippets = {
    snippets.gen_loader.from_file(vim.fn.stdpath('config') .. '/snippets/global.json'),
    snippets.gen_loader.from_lang(),
  },
})
