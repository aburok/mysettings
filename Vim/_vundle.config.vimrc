" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#same_filetypes = {}
"let g:neocomplete#same_filetypes._ = '_' " - CALLS UNDEFIEND VARIABLE ??
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    "return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1


" vim-notes notes directory"
" "let g:notes_directory = [']
noremap <silent> <F11> :cal VimCommanderToggle()<CR>


" Vim CamelCase {
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
omap iw <Plug>CamelCaseMotion_iw
xmap iw <Plug>CamelCaseMotion_iw
omap ib <Plug>CamelCaseMotion_ib
xmap ib <Plug>CamelCaseMotion_ib
omap ie <Plug>CamelCaseMotion_ie
xmap ie <Plug>CamelCaseMotion_ie
" }


" Vim-Notes {
" shortcuts for opening notes
nnoremap <leader>n3 :tabnew note:3things<CR>
nnoremap <leader>np :tabnew note:todo<CR>
nnoremap <leader>nt :tabnew note:privTodo<CR>

" vim-notes plugin settings
let g:notes_directories = ['C:/Dropbox/Notes']
let g:notes_suffix = '.note'

" }

" NERDTree {
" Automatically open NERDTree when entering vim autocmd vimenter * NERDTree
" close NERDTree if it's only window left
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Map toggling NERDTree to Ctrl + n
noremap <C-g> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeShowBookmarks=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore=['\~$', '^\.git$', 'vendor', '^\.nuget$', '^\.vs$', '^packages$']
"let g:NERDTreeNodeDelimiter = "\u00a0"

" NERDCommenter {
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" }


"
" For Editing books with code"
" looking for Open Curly Bracket and intending its content"
nmap <leader>fi /{<cr>vi{>
"
" Searching for Open Curly Bracket with not intended content"
" g/\(\s\+\){\_s\1\S/$vi{>

" Removing Leading spaces in code sections"
nmap <leader>fn /<pre>\_s\s\+<CR>$vit<

" Intending content of Curly Bracket that is not intended"
nmap <leader>fc /\(\s\+\){\_s\1\S<CR>$vi{>

" Intending content of Curly Bracket that is on the left border of screen"
nmap <leader>fb /\_s{\_s\S<CR>jvi{>

" Surround with <pre> tag and remove <p> from each line
vmap <leader>fp S<pre>$movit:s/<p>\(.\+\)<\/p>/\1/g<CR>/Listing<cr>


" Vim-AirLine
function! AirlineInit()
    let g:airline_section_z = airline#section#create_right(['%2cc %3lr %Lt'])
endfunction
autocmd vimenter * call AirlineInit()
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" Set custom fileType for Anki (Flash cards)
au BufRead,BufNewFile *.janki set filetype=json
au BufRead,BufNewFile *.janki set syntax=json

" Set syntax for less files
au BufRead,BufNewFile *.less set filetype=less.css



"" netrw magic
"" enable mouse usage. makes it easier to browse multiple tabs
"set mouse=a
"" hide netrw top message
"let g:netrw_banner=0
"" tree listing by default
"let g:netrw_liststyle=3
"" hide vim swap files
"let g:netrw_list_hide='.*\.swp$'
"" open files in left window by default
"let g:netrw_chgwin=1
""
"" "Then we’ll make it open the file in the previous window to the right of the project drawer:
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1

"""We can also set the width of the window. The value is set in percent of the total window width:
"let g:netrw_winsize = 20

" remap shift-control to fire up the sidebar
"nnoremap <silent> <S-CR> :leftabove 50vs<CR>:e .<CR>
" remap control-enter to open files in new tab
"nmap <silent> <C-CR> t :leftabove 20vs<CR>:e .<CR>:wincmd h<CR>

"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END


" CTRLP settings "
" Ignoring directories from CTRLP path
if has('win32')
    set wildignore+=*\\node_modules\\*
    set wildignore+=*\\.git\\*
    set wildignore+=*\\bower_components\\*
    set wildignore+=*\\packages\\*
    set wildignore+=*\\obj\\*
    set wildignore+=*\\bin\\*
    set wildignore+=*\\Merck.Manuals.DevSitecore\\WebSite\\sitecore\\*
    set wildignore+=*\\Merck.Manuals.DevSitecore\\Website\\sitecore_files\\*
elseif has('unix')
    set wildignore+=*/node_modules/*
    set wildignore+=*/.git/*
    set wildignore+=*/bower_components/*
    set wildignore+=*/packages/*
    set wildignore+=*/obj/*
    set wildignore+=*/bin/*
    set wildignore+=*/Merck.Manuals.DevSitecore/WebSite/sitecore/*
    set wildignore+=*/Merck.Manuals.DevSitecore/Website/sitecore_files/*
endif
let g:ctrlp_cmd='CtrlP :pwd'
