" POSTS ON INTENET ABOUT VIMRC :)
" http://spf13.com/post/perfect-vimrc-vim-config-file


set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set history=100

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

" WINDOWS BINDINGS
" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+


" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w
nmap <leader>w :w!<cr>

let g:mapleader = ','
let mapleader = ','




" show matching bracket
set showmatch
set incsearch
set ignorecase
set wildmenu  " show list instead of just completing
set wildmode=list:longest,full

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

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

" set backup
" set backupdir=~/.vim/backup
" set directory=~/.vim/tmp

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
" nmap <C-j> myo<esc>`y
" Ctrl + k
" nmap <C-k> myO<esc>`y

" Settings for spell checking
map <leader>ss :setlocal spell!<CR>

map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
imap <C-Space> <C-n>

set cursorline


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

map N Nzz
map n nzz


