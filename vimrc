scriptencoding utf-8

set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Vundle.vim'

Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'wgibbs/vim-irblack'

Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'jimenezrick/vimerl'

Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'Julian/vim-textobj-variable-segment'
Plugin 'deris/vim-textobj-enclosedsyntax'
Plugin 'nelstrom/vim-textobj-rubyblock'

Plugin 'wincent/Command-T'
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/taglist.vim'

Plugin 'houtsnip/vim-emacscommandline'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'wellle/tmux-complete.vim'
Plugin 'msanders/snipmate.vim'

Plugin 'kannokanno/vimtest'
call vundle#end()

filetype plugin indent on

syntax on
set encoding=utf8

set number
set laststatus=2
set t_Co=256


"" Tmux
autocmd VimEnter * nested if @% == '' | call system("tmux rename-window '[" . fnamemodify(getcwd(), ':t') . "]'") |
                        \ else | call system("tmux rename-window '[" . expand("%:t") . "]'") |
                        \ endif
autocmd VimLeave * call system("tmux set automatic-rename on")


"" Filetypes
autocmd BufNewFile,BufRead *.cap set filetype=ruby
autocmd BufNewFile,BufRead *.scss set filetype=scss
autocmd BufNewFile,BufRead *.coffee.erb set filetype=coffee.eruby
autocmd BufNewFile,BufRead *.scss.erb set filetype=scss.eruby
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

