set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=C:/mysettings/vim/vundle
set rtp+=C:/mysettings/vim
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
" "let path = 'C:/Dropbox/tools/vim/bundle/'
" "call vundle#rc(path)

" let Vundle manage xVundle, required
" Bundle 'gmarik/Vundle.vim'
"
" NerdTree is replace by native gvim explorer
Bundle 'https://github.com/scrooloose/nerdtree'
Bundle 'https://github.com/Xuyuanp/nerdtree-git-plugin'

Bundle 'https://github.com/kshenoy/vim-signature'
Bundle 'https://github.com/PProvost/vim-ps1'
Bundle 'https://github.com/bling/vim-airline'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
"Bundle 'tpope/vim-fugitive'
Bundle 'https://github.com/easymotion/vim-easymotion.git'
Bundle 'https://github.com/vim-scripts/camelcasemotion'
Bundle 'https://github.com/pangloss/vim-javascript'

Bundle 'https://github.com/tpope/vim-surround'
"Bundle 'https://github.com/yegappan/mru'

Bundle 'https://github.com/xolox/vim-misc'
Bundle 'https://github.com/xolox/vim-notes'
" "Bundle 'https://github.com/lpenz/vimcommander'

Bundle 'vim-scripts/sessionman.vim'
Bundle 'https://github.com/scrooloose/nerdcommenter'

Bundle 'spf13/vim-autoclose'
"Bundle 'tpope/vim-fugitive'
Bundle 'https://github.com/tpope/vim-sensible'

" Bundle 'Valloric/YouCompleteMe'
" "Bundle 'https://github.com/Shougo/neocomplcache.vim'
Bundle 'https://github.com/Shougo/neocomplete.vim'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "https://github.com/garbas/vim-snipmate"

Bundle 'https://github.com/honza/vim-snippets.git'
" "Bundle 'https://github.com/kien/rainbow_parentheses.vim'

"Bundle 'https://github.com/vim-scripts/Conque-Shell.git'
" "Bundle 'https://github.com/nosami/Omnisharp'

" Fuzzy finding files , Fuzzy Finder doesn't work because it cannt load L9
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" === I've replaced it with CtrlP
"
" Kien version of this is not maintained any more.
"Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'https://github.com/ctrlpvim/ctrlp.vim'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
" scripts not on GitHub
" "Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///home/gmarik/path/to/plugin'
"" ...

Bundle 'https://github.com/groenewege/vim-less'

Bundle 'https://github.com/scrooloose/syntastic'

" "Bundle 'https://github.com/plasticboy/vim-markdown.git'

syntax on
filetype on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" Put your stuff after this line

Bundle 'https://github.com/stevearc/vim-arduino'
Bundle 'https://github.com/vim-scripts/Arduino-syntax-file'

Bundle 'https://github.com/hnamikaw/vim-autohotkey'

Bundle 'https://github.com/gcmt/taboo.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
