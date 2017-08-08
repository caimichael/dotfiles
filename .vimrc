"================="
" Michael's vimrc "
"================="
"
let mapleader = ","

filetype plugin on
set clipboard=unnamed
if $TMUX == ''
    set clipboard+=unnamed
endif
set encoding=utf-8
set esckeys
set nobackup
set nowb
set noswapfile
set shortmess+=A

" Search behavior
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <Leader><space> :noh<cr>

" Line number management
set relativenumber
set number
" for optionally turning off line numbers
nmap <C-N><C-N> :set invnumber \| :set invrelativenumber<CR>

"============="
  "Solarized"
"============="
"
syntax enable
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

"============="
   "Vundle"
"============="
"
set shell=/bin/bash

set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim
"let path='$HOME/.vim/bundle'
call vundle#begin('$HOME/.vim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-sensible'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'luochen1990/rainbow'
Plugin 'easymotion/vim-easymotion'

call vundle#end()
filetype plugin indent on

"=================="
" PACKAGE SETTINGS "
"=================="
"
" NERDTree
map <Leader>t :NERDTreeToggle <CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 1
let g:NERDTrimTrialingWhitespace = 1

" Rainbow
let g:rainbow_active = 1

" Easymotion
map <Leader> <Plug>e                " <Leader><Leader>e for easy searching
nmap s <Plug>(easymotion-overwin-f) " <Leader>s <char> for bi-directional char easy search
nmap S <Plug>(easymotion-overwin-f2)" <Leader>S <char><char> for bi-directional 2char search

"============="
" INDENTATION "
"============="
"
"" Render tabs as 4 spaces
set tabstop=4                   " Tabs are four spaces
set softtabstop=4               " Tabs counts as four spaces
set shiftwidth=4                " << >> gives you four spaces

" For those who have the sanity to use 4 spaces
set smarttab
set expandtab

set autoindent                  " Auto indent
set smartindent                 " Smart indent

" Toggle autoindent for copy paste
set pastetoggle=<F2>

"========="
" MOTION  "
"========="
"
"Save pinky finger from harm.
inoremap jk <Esc>
vnoremap jk <Esc>

" Fast Scroll
map <C-J> 5j
map <C-K> 5k
map <C-H> 5h
map <C-L> 5l

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

"========="
" MOTION  "
"========="

"Highlight trailing whitespace
highlight ExtraWhiteSpace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+\%#\@<!$/

"F5 to strip all trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"==============="
" MISCELLANEOUS "
"==============="
"
" persist undo
let undodir = '$HOME/.vim/undodir'
call system('mkdir -p ' . undodir)
set undofile

" persist last cursor position
call system('mkdir -p' . '$HOME/.vim/view')
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent! loadview

