-- key configs
require('config.keymap')
require('config.lazy')
require('config.set')

-- custom plugins
require('plugins.custom.float-term')
require('plugins.custom.bot-term')

-- checks time for vim
vim.cmd("set autoread | au CursorHold * checktime")

--  allos for luarocks installation at top level
return {
  "vhyrro/luarocks.nvim",
  priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
  config = true,
}
