scriptencoding utf-8

set nocompatible
set exrc

execute pathogen#infect()
filetype plugin indent on

syntax on
set encoding=utf8

set number
set laststatus=2
set t_Co=256


"" Filetypes
autocmd BufNewFile,BufRead *.cap set filetype=ruby
autocmd BufNewFile,BufRead *.coffee.erb set filetype=coffee.eruby
autocmd BufNewFile,BufRead *.scss.erb set filetype=css.scss.eruby
autocmd BufNewFile,BufRead nginx.conf set filetype=nginx
autocmd BufNewFile,BufRead Makefile.* set filetype=make
autocmd BufNewFile,BufRead *.app set filetype=erlang
autocmd BufNewFile,BufRead *.rl set filetype=ragel


"" Whitespace
set tabstop=2                   " a tab is two spaces
set shiftwidth=2                " an autoindent (with <<) is two spaces
set expandtab                   " use spaces, not tabs

autocmd FileType erlang set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType c      set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType objc   set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType make   set                                      noexpandtab


"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they containa at least one capital letter


"" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
"" except when commiting to git
autocmd BufReadPost COMMIT_EDITMSG
  \ exe "normal! gg"


"" Colorscheme
augroup highlightIdeographicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

highlight SpecialKey ctermbg=235
set list listchars=tab:\ \ ,trail:\ 

let g:jellybeans_background_color_256=0
colorscheme jellybeans


"" Key bindings
let mapleader = ','
inoremap jj <ESC>
nnoremap j gj
nnoremap k gk
nnoremap Y y$


"" Plugin configurations
" Command-T
nnoremap <silent> <Leader>f :CommandTFlush<CR>
set wildignore+=vendor/bundle/**
set wildignore+=test/**/vendor/bundle**
set wildignore+=tmp/**
set wildignore+=log/**
set wildignore+=*.beam


" vim-textobj-rubyblock
runtime macros/matchit.vim


" vim-rails
let g:rails_projections = {
  \ "*.cap": {
  \   "keywords": "namespace desc task before after"
  \ }
  \}

" vim-easy-align
vmap <Leader>a  <Plug>(EasyAlign)
nmap <Leader>a  <Plug>(EasyAlign)

