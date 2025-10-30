lua require("settings")

set number
set relativenumber

set smartindent
set tabstop=4
set shiftwidth=4
set showtabline=4
set nowrap
set noswapfile
set winborder="rounded"
set termguicolors

set signcolumn=yes
set wrap

" save to clipboard
set clipboard=unnamedplus

" Markdown previewer
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_port = '5555'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_combine_preview = 0
let g:mkdp_page_title = '${name}'
