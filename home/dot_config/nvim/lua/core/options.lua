-- General settings
local o = vim.opt
local g = vim.g

o.number = true
o.relativenumber = true

-- Appearance
o.winborder = "rounded" -- Neooion expects string for values like "rounded"
o.termguicolors = true
o.signcolumn = "yes" -- "yes" is a string value for this option
o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
o.wrap = true

-- Indentation
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4

-- Searching
o.incsearch = true
o.hlsearch = true

-- Other
o.showtabline = 4
o.swapfile = true
o.clipboard = "unnamedplus"

-- Folding using treesitter
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 99

-- Markdown previewer global variables
g.mkdp_auto_start = 0
g.mkdp_auto_close = 1
g.mkdp_port = '5555'
g.mkdp_filetypes = {'markdown'}
g.mkdp_combine_preview = 0
g.mkdp_page_title = '${name}'

-- Vim-Go global variables
g.go_fmt_command = "goimports"
g.go_fmt_autosave = 1

