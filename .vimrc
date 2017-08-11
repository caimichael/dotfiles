"================="
" Michael's vimrc "
"================="
"
execute pathogen#infect()
let mapleader = ","

filetype plugin on
set shell=/bin/bash
set clipboard=unnamed
if $TMUX == ''
    set clipboard+=unnamed
endif
set encoding=utf-8
set number
set esckeys
set nobackup
set nowb
set noswapfile
set nocompatible
set shortmess+=A

"============="
  "Solarized"
"============="
"
syntax enable
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

"=================="
" PACKAGE SETTINGS "
"=================="
"
" NERDTree
map <Leader>n :NERDTreeToggle <CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" open nerdtree automatically if vim is opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if the only window left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 1
let g:NERDTrimTrialingWhitespace = 1

" Airline
let g:airline_solarized_bg='dark'

" Rainbow
let g:rainbow_active = 1

" Easymotion
map <Leader> <Plug>e
nmap s <Plug>(easymotion-overwin-f)
nmap S <Plug>(easymotion-overwin-f2)

" IncSearch/General Search Behavior
set hlsearch
set ignorecase
set smartcase
let g:incsearch#auto_nohlsearch = 1
map / <Plug>(incsearch-forward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
nnoremap <silent><Leader><space> :noh<cr>

"============="
" INDENTATION "
"============="
"
" Render tabs as 4 spaces
set tabstop=4                   " Tabs are four spaces
set softtabstop=4               " Tabs counts as four spaces
set shiftwidth=4                " << >> gives you four spaces

" For those who have the sanity to use 4 spaces
set smarttab
set expandtab

set autoindent
set smartindent

"========="
" MOTION  "
"========="
"
"Save pinky finger from harm.
inoremap jk <Esc>
vnoremap hl <Esc>

" Fast Scroll
map <C-J> 5j
map <C-K> 5k
map <C-H> 5h
map <C-L> 5l

"=========="
" CLEANUP  "
"=========="

"Highlight trailing whitespace
highlight ExtraWhiteSpace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+\%#\@<!$/

"F5 to strip all trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

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

" Prepping for Tmux Copy
autocmd FilterWritePre * if &diff | exe "silent! IndentLinesDisable" | endif
function! ToggleTmuxCopy()
    if g:indentLine_enabled
        silent! IndentLinesToggle
    endif
    set invnumber
endfunction
nnoremap <silent> <leader>t :call ToggleTmuxCopy()<CR>

" Toggle autoindent for copy paste
nnoremap <silent> <leader>p :set invpaste<CR>
