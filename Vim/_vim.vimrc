
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

" CTRL + Space for autocomplete/suggestions
inoremap <C-Space> <C-N>

cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" nnoremap <Leader>o mto<Esc>`t
" nnoremap <Leader>O mtO<Esc>`t

nnoremap zj :join<CR>

" go to last used tab
" store last used tab number in global variable "
let g:lasttab = 1
" go to tab with number stored in lasttab"
nmap gl :exe "tabn ".g:lasttab<CR>
" on event TabLeave assing tab page number to lasttab"
autocmd TabLeave * let g:lasttab=tabpagenr()



"- DELETED - to much confusion with default behavior
" nnoremap p i<C-R>0<Esc> 

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

" Sessions in vim "
nmap <F8> :mksession! ~\\vim_session <CR>    " Quick write session
nmap <F9> :source ~\\vim_session <CR>        " Quick load session

"Find a WORD under cursor with vimgrep"
" "nnoremap <S-Space> "fyaW:vimgrep /\<<C-R>f\>/ *
" Find / Search for word currently selected
vnoremap <C-F> "fy:!findstr /s /i /c:<C-R>f ./*.*<CR>

" REFRESH / RELOAD FILE
noremap <F5> :e!<CR>G
noremap <C-R> :e!<CR>G
nnoremap <leader><leader> :e!<CR>G

" RELOAD THIS CONFIGURATION
noremap <C-F5> :source $MYVIMRC<CR>
noremap <F7> :source $MYVIMRC <CR>
noremap <F12> :source $MYVIMRC <CR>
nnoremap <leader>lc :source $MYVIMRC<CR>

" Text decorations "
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

" :%!python -m json.tool"

" Syntax higlitning "
syntax on

" Loading color scheme using concrete file path
" setting it via colorscheme gruvbox will not work (2023-10)
if filereadable("/mysettings/Vim/colors/gruvbox.vim")
    source /mysettings/Vim/colors/gruvbox.vim
endif

if filereadable("C:/mysettings/Vim/colors/gruvbox.vim")
    source C:/mysettings/Vim/colors/gruvbox.vim
endif
" NO NEED TO CALL :colorscheme gruvobx - Loading a file is enough
" colorscheme gruvbox
" colorscheme sol <CR>


nnoremap <leader>dp :! dbuild && dtag && dpub <CR>

nnoremap <leader>ka :! kubectl apply -f %<Tab> <CR>

" colorscheme desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40