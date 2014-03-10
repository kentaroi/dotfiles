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

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2                   " a tab is two spaces
set shiftwidth=2                " an autoindent (with <<) is two spaces
set expandtab                   " use spaces, not tabs


"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they containa at least one capital letter

let g:jellybeans_background_color_256=0
colorscheme jellybeans

let mapleader = '.'
inoremap jj <ESC>
nnoremap j gj
nnoremap k gk
nnoremap Y y$

