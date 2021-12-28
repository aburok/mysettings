"--------------------------------------------------------------------------------  
" Base VIM configuration used by VIM editor, Visual Studio VsVim and Rider IdeaVim
"-------------------------------------------------------------------------------- 

" Set leader to space
let g:mapleader = ' '
let mapleader = ' '

map Q <nop>
nnoremap q :wq<CR>
nnoremap P "0p
vnoremap P "0p

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

" No Error sound during editing
set visualbell

nnoremap - $
xnoremap - $

nnoremap <enter> i<cr><esc>

" WINDOWS BINDINGS
" backspace in Visual mode deletes selection
vnoremap <BS> X

" + http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" MOVE BETWEEN SPLITS
nnoremap <M-h> <C-W>h
nnoremap <M-j> <C-W>j
nnoremap <M-k> <C-W>k
nnoremap <M-l> <C-W>l

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

cnoremap <C-V>		<C-R>+
cnoremap <S-Insert>		<C-R>+

" CTRL-S is Save File
inoremap <C-S> <Esc>:w!<cr>a

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

vnoremap <leader>d "dy'>p

