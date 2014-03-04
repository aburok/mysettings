" POSTS ON INTENET ABOUT VIMRC :)
" http://spf13.com/post/perfect-vimrc-vim-config-file


set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number

set guifont=Consolas:h11

colorscheme desert

imap jj <esc>

set autoread

" + http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

"set splitbelow
set splitright

" <C-W>_
" <C-W>=

nmap <leader>w :w!<cr>


let mapleader = ','
let g:mapleader = ','



" show matching bracket
set showmatch
set incsearch
set ignorecase
set wildmenu  " show list instead of just completing



" Turns of annoying sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500


colorscheme desert
set guifont=Consolas:h11
set encoding=utf8

set nobackup " not ~ files
set nowb " ???
set noswapfile " no .swp files :)

set shiftwidth=3 " ???
set number " Show line numbers
set ruler " Show position in file

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

" map space in normal mode to Search :)
nnoremap <space> /

map 0 ^

" move a line of text using Alt + [jk]
nmap <M-j> my:m+<cr>`y
nmap <M-k> my:m-2<cr>`y

" Inserting blank line below/above current line
" Ctrl + j
nmap <C-j> myo<esc>`y
" Ctrl + k
nmap <C-k> myO<esc>`y

" Settings for spell checking 
map <leader>ss :setlocal spell!<CR>

map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
imap <C-Space> <C-n>

set cursorline

