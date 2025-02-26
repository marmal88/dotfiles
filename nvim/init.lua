require('config.keymap')
require('config.lazy')
require('config.set')
require('plugins.custom.float-term')
require('plugins.custom.bot-term')

vim.cmd("set autoread | au CursorHold * checktime")
