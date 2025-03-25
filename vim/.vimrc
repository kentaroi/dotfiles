scriptencoding utf-8
set encoding=utf-8
set bg=dark

call plug#begin()

" Filer
Plug 'mattn/vim-molder'

" Fuzzy finder
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Cursor move
Plug 'rhysd/clever-f.vim'
Plug 'easymotion/vim-easymotion'

" Text Object and Selection
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'tpope/vim-surround'

" Comment
Plug 'tomtom/tcomment_vim'

" Align
Plug 'junegunn/vim-easy-align'

" vim-emacscommandline
Plug 'houtsnip/vim-emacscommandline'

" Auto Completion
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Plug 'mattn/vim-lsp-icons'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug '~/Works/Libraries/vsnip-snippets'

" Registers
Plug 'junegunn/vim-peekaboo'

" Marks
Plug 'kshenoy/vim-signature'

" Window
Plug 'AndrewRadev/undoquit.vim'
Plug 'itchyny/lightline.vim'

" Git
Plug 'airblade/vim-gitgutter'

" Diff
Plug 'AndrewRadev/linediff.vim'

" Bracketed paste
" Plug 'wincent/terminus'
" Plug 'ConradIrwin/vim-bracketed-paste'

" man
Plug 'jez/vim-superman'

" Colorscheme
Plug 'vim-scripts/wombat256.vim'
Plug 'wgibbs/vim-irblack'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'

" Language specifics
Plug 'elixir-editors/vim-elixir'

Plug 'dart-lang/dart-vim-plugin'
Plug 'keith/swift.vim'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'

Plug 'tpope/vim-liquid'
Plug 'lepture/vim-jinja'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-markdown'

call plug#end()

filetype on
set nocompatible
filetype indent on
filetype plugin on

syntax on

set number
set relativenumber
set ruler
set laststatus=2
set t_Co=256
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
nnoremap <silent><Space> :nohl<Bar>:echo<CR>

set directory^=$HOME/.vim/swap//

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
" except when commiting with git
autocmd BufReadPost COMMIT_EDITMSG
  \ exe "normal! gg"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileType
autocmd BufNewFile,BufRead *.thor set filetype=ruby

autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html
autocmd BufNewFile,BufRead *.scss.erb set filetype=css.scss.eruby
" autocmd BufNewFile,BufRead *.html.eex set filetype=eelixir.html
autocmd BufNewFile,BufRead *.eex,*.heex set filetype=eelixir.html

" autocmd BufNewFile,BufRead *.scss set filetype=css.scss
autocmd BufNewFile,BufRead *.swift set filetype=swift
autocmd BufNewFile,BufRead *.h set filetype=objc
autocmd BufNewFile,BufRead *.njk set filetype=jinja

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab configurations

" how many columns a tab counts for
setglobal tabstop=2

" how many columns text is indented with the reindent operation (<< and >>)
setglobal shiftwidth=2

" When expandtab is set,
" hitting Tab in insert mode will produce the appropriate number of spaces
setglobal expandtab

autocmd FileType ruby set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType actionscript set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType html set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType erlang set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType c set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType objc set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType swift set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType plist set noexpandtab
autocmd FileType vim set shiftwidth=2 softtabstop=2 expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme and highlights

augroup highlightIdeographicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

augroup configurationsForCommandT
  autocmd!
  autocmd Colorscheme * highlight CommandTCharMatched term=bold,underline cterm=bold,underline gui=bold,underline ctermfg=81 guifg=#8fbfdc
augroup END

let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  " colorscheme jellybeans
  colorscheme gruvbox
  let g:gruvbox_contrast_dark = 'hard'
else
  colorscheme ir_black
endif

highlight SpecialKey ctermbg=235
set list listchars=tab:\ \ ,trail:\ 
"set list listchars=tab:\ \

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
" Practical Vim, Tip 86, Search for the Current Visual Selection
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key maps

let mapleader = ','
inoremap jj <ESC>
" nnoremap j gj
" nnoremap k gk
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> gj v:count ? 'gj' : 'j'
nnoremap <expr> gk v:count ? 'gk' : 'k'
nnoremap Y y$

" Toggle between the beginning and the true beginning of line
nnoremap <expr> 0 virtcol('.') == indent('.')+1 ? '0' : '^'
xnoremap <expr> 0 virtcol('.') == indent('.')+1 ? '0' : '^'
onoremap <expr> 0 virtcol('.') == indent('.')+1 ? '0' : '^'

" Open files in the same directory
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <Leader>ew :e %%
map <Leader>es :sp %%
map <Leader>ev :vsp %%
map <Leader>et :tabe %%

" Tabs
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tt :tabnext<CR>
nnoremap <Leader>tc :tabnew<CR>

" Copy yanked text to Tmux TODO think about keymap
" https://superuser.com/a/1647220
" nnoremap <Leader>tm :call system("tmux load-buffer -", @0)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations

" fzf.vim
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>p :Files<Space>..<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" vim-textobj-rubyblock
" matchit must be enabled
runtime macros/matchit.vim

" tomtom/tcomment_vim
call tcomment#type#Define('c',    '// %s')
call tcomment#type#Define('objc', '// %s')
let g:tcomment_mapleader2 = '<Leader>c'
nnoremap <silent> <Leader>cc :TComment<CR>
vnoremap <silent> <Leader>cc :TComment<CR>

" Julian/vim-easy-align
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" vim-marked
nnoremap <silent> <Leader>md :MarkedOpen<CR>
nnoremap <silent> <Leader>mq :MarkedQuit<CR>

" gitgutter
" turn off by default
let g:gitgutter_enabled = 0
" toggle
nnoremap <silent> <Leader>gg :GitGutterBufferToggle<CR>
" close preview
nnoremap <silent> <Leader>hq :pclose<CR>

" lightline.vim
let g:lightline = {
      \   'colorscheme': 'Tomorrow_Night',
      \   'component_function': {
      \     'filename': 'LightlineFilename',
      \   }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction


" let g:asyncomplete_auto_popup = 0
let g:asyncomplete_popup_delay = 200
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,preview

let g:vsnip_snippet_dirs = ['~/Works/Libraries/vsnip-snippets/snippets']

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


let g:lsp_document_code_action_signs_enabled = 0

function! s:on_lsp_buffer_enabled() abort
  if g:my_lsp_diagnostics_enabled == 1
    call lsp#enable_diagnostics_for_buffer()
  else
    call lsp#disable_diagnostics_for_buffer()
  endif

  setlocal omnifunc=lsp#complete
  " setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:my_lsp_diagnostics_enabled = 0

function s:MyToggleLSPDiagnostics()
  if g:my_lsp_diagnostics_enabled == 1
    call lsp#disable_diagnostics_for_buffer()
    let g:my_lsp_diagnostics_enabled = 0
    echo "LSP Diagnostics : off"
  else
    call lsp#enable_diagnostics_for_buffer()
    let g:my_lsp_diagnostics_enabled = 1
    echo "LSP Diagnostics : on"
  endif
endfunction

command MyToggleLSPDiagnostics call s:MyToggleLSPDiagnostics()

nnoremap <Leader>gd :MyToggleLSPDiagnostics<CR>

" let g:lsp_settings = {
" \  'sourcekit-lsp': { 'cmd': ['sourcekit-lsp'] }
" \}

" Remove distractions
" let g:lsp_diagnostics_enabled = 0
" let g:lsp_document_code_action_signs_enabled = 0
" let g:lsp_document_highlight_enabled = 0

" let g:lsp_settings_servers_dir = '/Volumes/Bridgehead/Tools/vim-lsp-settings/servers'
" let g:lsp_settings = {
" \ 'analysis-server-dart-snapshot': {
" \   'cmd': [
" \     '/Volumes/Bridgehead/Applications/flutter/bin/cache/dart-sdk/bin/dart',
" \     'language-server',
" \   ],
" \ },
" \ 'typescript-language-server': {
" \   'workspace_config': {
" \     'completions': {
" \       'completeFunctionCalls': v:true,
" \     },
" \   },
" \ },
" \}

" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
