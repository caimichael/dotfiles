"================="
" Michael's vimrc "
"================="
"
execute pathogen#infect()
let mapleader = ","

filetype plugin on
set mouse=a
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
set foldmethod=manual
set textwidth=90
set wrap
set wrapscan
set linebreak               " Don't break midword when wrapping lines
set autoread    " Reload file open in Vim if edited outside of Vim session

"==========="
" Solarized "
"==========="
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

" Expand-Region
" from https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" IncSearch
set hlsearch
set ignorecase
set smartcase
let g:incsearch#auto_nohlsearch = 1
map / <Plug>(incsearch-forward)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)

nnoremap <silent><Leader><space> :noh<cr>

" Search and replace word underneath cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabNoCompleteBefore = ['=','^',',','\s']
let g:SuperTabNoCompleteAfter  = ['=','^',',','\s']

" Indentline
let g:indentLine_enabled = 0

" Ctrl-P Fuzzy Search
" Some performance improvement tips from
" https://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    " Use 'ag' (Silver Searcher) instead of vim's native globpath()
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
nnoremap <Leader>p <Esc>:CtrlP<space>

" Vim-Signature (For handling marks)
hi clear SignColumn " Remove that ugly gray

" Vimtex
let g:airline#extensions#vimtex#enabled = 1
let g:vimtex_compiler_latexmk = {'continuous': 0}

" Slime (for IDE-like interface between tmux, vim, and some REPL like Julia)
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

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

" Fast scroll
nnoremap J 5j
nnoremap K 5k
nnoremap H 5h
nnoremap L 5l

" Fast visual block selection
vnoremap J 5j
vnoremap K 5k
vnoremap H 5h
vnoremap L 5l

" Fix this...
" nmap [ }
" nmap ] {

" Nice parenthesis conventions
" Auto-add closing paren
" inoremap ( ()<Esc>:let leavechar=")"<CR>i
" inoremap [ []<Esc>:let leavechar="]"<CR>i
" inoremap { {}<Esc>:let leavechar="}"<CR>i
" Leave parens easily
" imap <C-m> <Esc>:exec "normal f" .leavechar<CR>a<space>
" ^above solution has some strange issues with insert mode enter

"==================="
" LANGUAGE SETTINGS "
"==================="
"
autocmd FileType python     setlocal tabstop=4 shiftwidth=4 textwidth=79 foldnestmax=2 foldmethod=indent
autocmd FileType matlab     setlocal tabstop=2 shiftwidth=2 | syntax keyword matlabRepeat parfor
autocmd FileType julia      setlocal tabstop=4 shiftwidth=4 textwidth=92
autocmd FileType markdown   setlocal tabstop=4 shiftwidth=4 textwidth=92 spell
autocmd FileType tex        setlocal                        textwidth=92 spell

"=========="
" CLEANUP  "
"=========="
"
"Highlight trailing whitespace
highlight ExtraWhiteSpace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+\%#\@<!$/

"F5 to strip all trailing whitespace
nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"===================="
" PERSONAL SHORTCUTS "
"===================="

" Spacing above and below
nnoremap <CR> o<Esc>

" When pasting, keep the currently copied values in buffer
vnoremap <leader>p "_dP

"==============="
" MISCELLANEOUS "
"==============="
"
" persist undo
call system('mkdir -p ' . '$HOME/.vim/undodir')
set undodir=$HOME/.vim/undodir
set undofile

" persist last cursor position
call system('mkdir -p' . '$HOME/.vim/view')
autocmd BufWinLeave ?* silent mkview
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
nnoremap <silent> <leader>pm :set invpaste<CR>

" Enforce being in the same directory as the file currently being edited
autocmd BufEnter * silent! lcd %:p:h
