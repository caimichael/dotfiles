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
" Enable the list of buffers/show filename
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Rainbow
let g:rainbow_active = 1

" Easymotion
map <Leader> <Plug>e
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
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabNoCompleteBefore = ['=','^',',','\s']
let g:SuperTabNoCompleteAfter  = ['=','^',',','\s']

" Indentline
let g:indentLine_enabled = 0

"============="
" ENVIRONMENT "
"============="
"
" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Closing all split buffers except active
nnoremap <silent> <C-O> <Esc>:on<CR>

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
vnoremap q <Esc>
nmap ; :

" Fast Scroll
nnoremap J 5j
nnoremap K 5k
nnoremap H 5h
nnoremap L 5l
" Fix this...
" nmap [ }
" nmap ] {

" Nice Parenthesis conventions
" Auto-add closing paren
" inoremap ( ()<Esc>:let leavechar=")"<CR>i
" inoremap [ []<Esc>:let leavechar="]"<CR>i
" inoremap { {}<Esc>:let leavechar="}"<CR>i
" Leave parens easily
" imap <C-m> <Esc>:exec "normal f" .leavechar<CR>a<space>
" ^above solution has some strange issues with insert mode enter

"=========="
" CLEANUP  "
"=========="
"
"Highlight trailing whitespace
highlight ExtraWhiteSpace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+\%#\@<!$/

"F5 to strip all trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"===================="
" PERSONAL SHORTCUTS "
"===================="

" Spacing above and below
nnoremap <CR> o<Esc>
nnoremap \ O<Esc>

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
