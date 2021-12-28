source C:/mysettings/Vim/_base.vimrc

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

set wildmenu  " show list instead of just completing
set wildmode=list:longest,full
set autoread
set cursorline

" Disable inserting new line characters in long lines
set textwidth=0 wrapmargin=0
set wrap " Wrap lines
set ai " Auto indent
set si " Smart indent

" show matching bracket
set showmatch
set ruler " Show position in file

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

colorscheme desert


cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" nnoremap <Leader>o mto<Esc>`t
" nnoremap <Leader>O mtO<Esc>`t

nnoremap zj :join<CR>

" Tabs binding
" CTRL-Tab is Next window
noremap <C-Tab> :tabnext<CR>
nnoremap <Tab> gt
noremap <C-S-Tab> :tabprevious<CR>
nnoremap <S-Tab> gT

noremap <C-N> :tabnew<CR>
noremap <C-T> :tabnew<CR>
noremap <C-S-W> :tabclose<CR>

" go to last used tab
" store last used tab number in global variable "
let g:lasttab = 1
" go to tab with number stored in lasttab"
nmap gl :exe "tabn ".g:lasttab<CR>
" on event TabLeave assing tab page number to lasttab"
autocmd TabLeave * let g:lasttab=tabpagenr()

" nnoremap p i<C-R>0<Esc> - DELETED - to much confusion with default behavior

""""""""""""""""""""""""""""""""""""""""
"  Yank File Stuff
""""""""""""""""""""""""""""""""""""""""
" Directory relative path to the PWD (e.g. Vim\_vim.vimrc)
nnoremap <leader>yr :let @+ = expand("%")<CR>
" Directory absolute path (e.g. C:\mysettings\Vim)
nnoremap <leader>yp :let @+ = expand("%:p:h")<CR>
" File absolute path (e.g. C:\mysettings\Vim\_vim.vimrc)
nnoremap <leader>yf :let @+ = expand("%:p")<CR>
" File absolute path (e.g. _vim.vimrc)
nnoremap <leader>yn :let @+ = expand("%:t")<CR>

" Close window"
"============="
nnoremap zx :wq<CR>

nnoremap <leader>rr viwP

" Find selected text / Search for visual selected text
nnoremap <leader>ff yiw/<C-R>"<CR>
nnoremap <leader>f' yi'/<C-R>"<CR>
nnoremap <leader>f" yi"/<C-R>"<CR>
" vnoremap // y/<C-R>"<CR>
" FIND / SEARCH TEXT FROM CLIPBOARD
nnoremap <leader>fc /<C-R>+<CR>zz

" nnoremap <Space><Space> "tyiW:let @t = substitute(@t, "\/", '\\/', "g")<CR>/<C-R>t<CR>
" nnoremap <Space>( "tyi(:let @t = substitute(@t, "\/", '\\/', "g")<CR>/<C-R>t<CR>
" nnoremap <Space>" "tyi":let @t = substitute(@t, "\/", '\\/', "g")<CR>/<C-R>t<CR>
" nnoremap <Space>' "tyi':let @t = substitute(@t, "\/", '\\/', "g")<CR>/<C-R>t<CR>
" nnoremap <Space>< "tyi<:let @t = substitute(@t, "\/", '\\/', "g")<CR>/<C-R>t<CR>
" nnoremap <Space>c /<C-R>+<CR>zz
" vnoremap <Space> "ty:let @t = substitute(@t, "\/", '\\/', "g")<CR>/<C-R>t<CR>

" Sessions in vim "
nmap <F8> :mksession! ~\\vim_session <CR>    " Quick write session
nmap <F9> :source ~\\vim_session <CR>        " Quick load session

"Find a WORD under cursor with vimgrep"
" "nnoremap <S-Space> "fyaW:vimgrep /\<<C-R>f\>/ *
" Find / Search for word currently selected
vnoremap <C-F> "fy:!findstr /s /i /c:<C-R>f ./*.*<CR>

" FORMAT document
nnoremap <C-F> gg=G<C-O><C-O>zz
nnoremap <leader>kd gg=G<C-O><C-O>zz

" auto formatting
nnoremap <leader>kd gg=G<C-O><C-O>

nnoremap <leader>mc :set nohlsearch<CR>
    \Yp
    \V:s/[^\"\n]/=/g<CR>
    \kP
    \V:s/[^\"\n]/=/g<CR>
    \:let @/=""<CR>
    \:set hlsearch<CR>

" Pasting & replacing from 0 yank register
nnoremap <Leader>pp "0p
nnoremap <Leader>pc "+p
nnoremap <Leader>r viW"0p
"
" Those lines need to be commented when you try to do BundleUpdate
" Other wise it will throw the vundle_last_status error
" https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows
"set shell=powershell
"set shellcmdflag=-command


nnoremap <Leader>cd :cd %:p:h<CR>

" This will add header comment with default # sign
nnoremap <Leader>ch :center 80<CR>3hv0r#A<Space><Space><Esc>40A#<Esc>d80<Bar>YppVr#kk.

" function! commentBlock(comment)
"     return "\<C-V>^I" . comment . " \<ESC>"
" endfunction

vnoremap <leader>cx <C-V>lx<ESC>
vnoremap <leader>c# <C-V>^I# <ESC>
vnoremap <leader>c' <C-V>^I' <ESC>
vnoremap <leader>c; <C-V>^I;<ESC>
" vnoremap <leader>c' =commentBlock(<C-V>^I' <ESC>

let g:syntastic_shell = "/usr/bin/bash"

" REFRESH / RELOAD FILE
noremap <F5> :e!<CR>G
noremap <C-R> :e!<CR>G
nnoremap <leader><leader> :e!<CR>G

" RELOAD THIS CONFIGURATION
noremap <C-F5> :source $MYVIMRC<CR>
noremap <F7> :source $MYVIMRC <CR>
noremap <F12> :source $MYVIMRC <CR>
nnoremap <leader>lc :source $MYVIMRC<CR>
nnoremap <leader>ls :scriptnames<CR>

" Save and run current file
noremap <S-F5> <Esc>:w<CR>:!%:p<CR>

" Open files"
nnoremap <leader>or :browse :oldfiles!<CR>

" Text decorations "
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

" :%!python -m json.tool"
