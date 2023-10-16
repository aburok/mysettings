
"" Base VIM configuration used by 
" VIM CMD editor, 
" gVIM editor,
" Visual Studio VsVim and 
" Rider IdeaVim
"-------------------------------------------------------------------------------- 
"
"" Set leader to space
let g:mapleader = ' '
let mapleader = ' '

" set number " Show line numbers
" https://jeffkreeftmeijer.com/vim-number/
set number 
set relativenumber
set history=100

set incsearch
set hlsearch
" Pressing * will select a word and serch for it in a file
set ignorecase
set showcmd
set mouse=n

" No Error sound during editing
set visualbell

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set bg=dark

nnoremap - $
xnoremap - $

nmap Q :q<cr>
vmap Q <esc>:q<cr>

nnoremap <enter> i<cr><esc>

" WINDOWS BINDINGS
" backspace in Visual mode deletes selection
vnoremap <BS> X

" "nnoremap <leader>cd :cd %:h:p<CR>
set autochdir

" + http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" MOVE BETWEEN SPLITS
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
nnoremap <leader>y" vi""+y
nnoremap <leader>y' vi'"+y
nnoremap <leader>y( vi("+y

" CTRL-V and SHIFT-Insert are Paste
noremap <S-Insert>		"+gp

cnoremap <C-v>		    <C-R>+
nnoremap <C-v>		    "+gp
inoremap <C-v>		    <C-R>+
cnoremap <S-Insert>		<C-R>+
inoremap <S-Insert>	    <C-R>+

" CTRL-S is Save File
inoremap <C-S> <Esc>:w!<cr>a
nnoremap <C-S> :w!<cr>

" File operations
nnoremap <leader>ss :w!<cr>
nnoremap <leader>sa :wall!<cr>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G

" Execute command recorded in register a by pressing `
nnoremap ` @a
" Repeating command on each line of Visual Selection recorded into register a
vnoremap ` :normal @a<CR>

" after going to next find , center the screen on the finding "
noremap N Nzz
noremap n nzz

"Find and Replace Text
vnoremap <leader>re "hy:%s/<C-R>h//gc<left><left><left>
nnoremap <leader>rw viw"hy:%s/<C-R>h/<C-R>h/gc
nnoremap <Leader>dw :%s/[ \n\t]//g
nnoremap <leader>rr "9yiW:%s/<C-R>9/<C-R>9/gc<LEFT><LEFT><LEFT>
vnoremap <F3> "hy:%s/<C-R>h//gc<left><left><left>
nnoremap <F3> "9yiW:%s/<C-R>9/<C-R>9/gc<LEFT><LEFT><LEFT>

nnoremap <leader>*' yi'/<C-R>"<CR>
nnoremap <leader>*" yi"/<C-R>"<CR>
nnoremap <leader>*0 yi(/<C-R>"<CR>

vnoremap * "sy/<C-R>s<CR>

vnoremap rr "_dhP
vnoremap ra "ddh"ap
vnoremap a "ay

vnoremap <leader>d "dy'>o<Esc>p

nmap H :tabprevious<CR>
nmap L :tabnext<CR>

