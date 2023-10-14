
autocmd GUIEnter * simalt ~x

" https://github.com/scrooloose/syntastic
" :SyntasticInfo  -  see available syntax checkers


" syntax on " turn on syntax high:wq

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Turns of annoying sounds
set noerrorbells
set novisualbell
set tm=500


colorscheme desert
set guifont=Consolas:h11
set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar from window
set guioptions-=r " remove right-hand scroll bar

set encoding=utf8

set nobackup " not ~ files
set nowb " ???
set noswapfile " no .swp files :)

" set backup
" set backupdir=~/.vim/backup
" set directory=~/.vim/tmp

" set shiftwidth=3 " ???

" Folding {
" This will fold all blocks by default when file is open
set foldmethod=indent
" This will open folds to given level when file is open
set foldlevel=10
set nofoldenable    " disable folding
" zc - close fold,
" zC - close All faldings
" zo - open fold,
" zO - Opens All foldings
" za - toggle fold
" zA - Toggle All Foldings
"
"    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>
" }


" Settings for spell checking
nnoremap <leader>ss :setlocal spell!<CR>

nnoremap <leader>sn ]s " Go to next misspelled word
nnoremap <leader>sp [s " Go to previous misspelled word
"map <leader>sa zg " Add word under cursor to the good words file
nnoremap <leader>s? z=  " Suggest correct word for word under the cursor
inoremap <C-Space> <C-n>


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  autocmd!

  "" For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

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

" belowe command will make word before cursor UPPERCASE
" gU - make UPPERCASE
" iw - the whole word
" `]a - go to last position and append
" map! <C-F> <Esc>gUiw`]a


" Abbreviations
iab cwl Console.WriteLine
iab rtfm Read The Fine Manual
iab wtf What The Fuck
iab brb Be Right Back
iab imho In My Humble Opinion
iab lol Lought Out Loud


" Marks line with TODO as DONE
nnoremap <leader>td V:s/TODO/DONE/I<CR>
nnoremap <leader>tt A - TODO<Esc>
nnoremap <leader>tm jmlkdd/^DONE TASKS$/I<CR>p$a - <Esc><leader>it'l

" Insert current date time
nnoremap <leader>it "=strftime("%c")<CR>p
" inoremap <leader>it <C-R>=strftime("%c")<CR>


" Forcing Vim to open any file in new tab cause NERDTree to behave weird
" "autocmd BufAdd,BufNewFile * nested tab sball

" GIT mapping
nnoremap <Leader>gd :!git diff %<CR><Space>

" Insert commented horizontal line
nnoremap <Leader>l i<C-O>79i=<Esc>

set mouse=a

imap <C-Space> <Plug>snipMateNextOrTrigger

" guit tab label
" http://stackoverflow.com/questions/2468939/how-to-let-tab-display-only-file-name-rather-than-the-full-path-in-vim

set guitablabel=\[%N\]         " number of current tab"
set guitablabel+=\ %t          " trim to last 20 characters of file name"
set guitablabel+=\ %M          " change indicator - *"


if isdirectory("C:/mysettings")
  cd C:/mysettings
endif
if isdirectory("C:/Projects")
  cd C:/Projects
endif
