lua require("settings")

set number
set relativenumber

set smartindent
set tabstop=4
set shiftwidth=4
set showtabline=4
set noswapfile
set winborder="rounded"
set termguicolors

set signcolumn=yes
set wrap
set incsearch
set hlsearch

" default save to "+ register
set clipboard=unnamedplus

" Markdown previewer
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_port = '5555'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_combine_preview = 0
let g:mkdp_page_title = '${name}'

" Folding using treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99

" Cursor
let &t_SI = "\e[5 q"    " changes curor to thin line on insert
let &t_EI = "\e[1 q"    " changes cursor to block on insert end

" Vim-Go
let g:go_fmt_command = "goimports"   " format imports with goimports
let g:go_fmt_autosave = 1            " autoformat on save
