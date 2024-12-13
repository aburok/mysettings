source C:/mysettings/Vim/_base.vimrc

" ------------------------------
" IdeaVim configuration for Rider
" ------------------------------
" 
" To show list of actions available for Rider, type:
"    :actionlist
" 

""" Map leader to space ---------------------

" Reload Configuration
nmap <leader>rc :source ~/.ideavimrc<CR>
nmap \e :e C:/mysettings/Vim/_ideavim.vimrc<CR>
nmap \r <Action>(IdeaVim.ReloadVimRc.reload)

"""" PLUGINS
" https://github.com/AlexPl292/IdeaVim-EasyMotion#setup
" Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'

" https://github.com/TheBlob42/idea-which-key?tab=readme-ov-file#installation
set which-key
let g:WhichKey_ShowVimActions = "true"
let g:WhichKey_FontSize = 16
g:WhichKey_CommandStyle = bold

set peekaboo
""" Plugins """

set surround
set multiple-cursors
set commentary
set argtextobj
set easymotion
set textobj-entire
set ReplaceWithRegister
set NERDTree
set quickscope

"  set sneak " <- szukanie przy uzyciu klawisza s i S - wylaczone bo używam S do zamiany lini
set which-key
set notimeout

""" Plugin settings -------------------------
let g:argtextobj_pairs='[:],(:),<:>'

""" Common settings -------------------------
set showmode
set so=5
set nu

""" IdeaVim specific settings ------------------
set ideajoin
set ideastatusicon=gray
set idearefactormode=keep

nmap Q <Action>(CloseEditor)
nmap zx <Action>(CloseEditor)

sethandler <C-B> i-v:vim
" sethandler <C-C> i-v:vim
sethandler <C-D> i-v:vim
" sethandler <C-F> n-v:vim
sethandler <C-h> a:vim
sethandler <C-i> a:vim
sethandler <C-j> a:vim
sethandler <C-k> a:vim
sethandler <C-l> a:vim
sethandler <C-M> n-v:vim
sethandler <C-o> a:vim
sethandler <C-Q> i-v:videvm
sethandler <C-p> a:vim
sethandler <C-t> n-v:vim
sethandler <C-w> n-v:vim
sethandler <C-A-f> a:vim
sethandler <C-S-A> i-v:vim
sethandler <C-S-d> a:vim
sethandler <C-S-P> a:vim
sethandler <C-s-t> i-v:vim
sethandler <C-s-l> a:vim
sethandler <C-s-j> a:vim
sethandler <C-s-k> a:vim
sethandler <A-_> a:vim
sethandler <S-j> n,v:vim
sethandler <S-j> n,v:vim
sethandler <A-+> a:vim
sethandler <A-`> a:vim
sethandler <A-S-1> a:vim
sethandler <A-2> a:vim
sethandler <A-S-2> a:vim
sethandler <A-S-4> a:vim
sethandler <A-3> a:vim
sethandler <A-6> a:vim

map <C-S-A> <Action>(EditorSelectWord)

""" Mappings --------------------------------
nmap <leader>rr <Action>(RenameElement)
nmap <leader>c <Action>(Stop)
nmap <leader>z <Action>(ToggleDistractionFreeMode)

nmap <leader>gh <Action>(Vcs.ShowTabbedFileHistory)


nmap gd <Action>(QuickImplementations)
nmap gD <Action>(GotoDeclaration)
nmap ga <Action>(GotoImplementation)
nmap gi <Action>(GotoImplementation)
nmap ge <Action>(ReSharperGotoNextErrorInSolution)
nmap gE <Action>(ReSharperGotoPrevErrorInSolution)
nmap gh <Action>(GotoNextError)
nmap gH <Action>(GotoPreviousError)
nmap gs <Action>(FileStructurePopup)
nmap gr <Action>(RecentLocations)

map <A-K1> <Action>(Resume)
map <A-`> <Action>(ActivateTerminalToolWindow)
map <A-S-1> <Action>(ActivateBookmarksToolWindow)
map <A-2> <Action>(Vcs.Show.Log)
map <A-S-2> <Action>(ActivateUnitTestsToolWindow)
map <A-S-3> <Action>(ActivateNuGetToolWindow)
map <A-S-4> <Action>(ActivateTerminalToolWindow)

map <C-S-d> <Action>(QuickTypeDefinition)
map <S-Space> <Action>(ShowErrorDescription)
map <C-S-Space> <Action>(ParameterInfo)

map <C-S-e> <Action>(ActivateProjectToolWindow)
map <leader>we <Action>(ActivateProjectToolWindow)

nmap <leader>bb <Action>(ToggleLineBreakpoint)
nmap <leader>be <Action>(EditBreakpoint)
nmap <leader>bt <Action>(XDebugger.MuteBreakpoints)

nmap <leader>u <Action>(FindUsages)
nmap gf <Action>(FindUsages) 

map <C-o> <Action>(Back)
nmap H <Action>(Back)
map <C-i> <Action>(Forward)
nmap L <Action>(Forward)

map <C-S-j> <Action>(MethodDown)
map <C-S-k> <Action>(MethodUp)

" EXPAND / COLLAPSE / FOLDING / UNFOLDING
nmap zC <Action>(CollapseRegionRecursively)
nmap zO <Action>(ExpandRegionRecursively)
nmap z1 <Action>(ExpandAllToLevel1)
nmap z2 <Action>(ExpandAllToLevel2)
nmap z3 <Action>(ExpandAllToLevel3)
nmap z4 <Action>(ExpandAllToLevel4)
nmap z5 <Action>(ExpandAllToLevel5)

" Ctrl + P - Mapped in AutoHotKey ( mapping via idaevim is almost impossible )
map <C-p> <Action>(GotoFile) 
map <C-S-p> <Action>(GotoAction)

" nmap go <C-S-n>
nmap <leader>aa <Action>(ShowIntentionActions)
nmap <leader>ar <Action>(RefactoringMenu)
nmap <C-e> <Action>(EditorSelectWord)

" MOVE BETWEEN SPLITS
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

nmap <leader>ws <Action>(SplitHorizontally)
" map <A-S--> <Action>(SplitHorizontally)
map <A-_> <Action>(SplitHorizontally)
nmap <leader>wv <Action>(SplitVertically)
map <A-+> <Action>(SplitVertically)
" map <S-A-=> <Action>(SplitVertically)
nmap <leader>wu <Action>(Unsplit)
nmap <leader>wc <Action>(ChangeSplitOrientation)
nmap <leader>wr <Action>(MoveTabRight)
nmap <leader>wd <Action>(MoveTabDown)

nmap <leader>ww <Action>(MoveEditorToOppositeTabGroup)
nmap <leader>wt <Action>(MoveEditorToOppositeTabGroup)

vmap <leader>ss <Action>(SurroundWith)
vmap <leader>sl <Action>(SurroundWithLiveTemplate)

nmap <leader>oo <Action>(ReformatCode)
vmap <leader>f <Action>(ReformatCode)
map <C-A-f> <Action>(ReformatCode)

"""""""""""""""""
""" BOOKMARKS """
nmap mm <Action>(ToggleBookmark)
nmap mn <Action>(ToggleBookmarkWithMnemonic)
nmap mx <Action>(DeleteMnemonicFromBookmark)
nmap '' <Action>(ShowBookmarks)
nmap 'j <Action>(GotoNextBookmark)
nmap 'k <Action>(GotoPreviousBookmark)

""" END : BOOKMARKS """
"""""""""""""""""""""""

nmap <leader>tr <Action>(RiderUnitTestRunContextAction)
nmap <leader>td <Action>(RiderUnitTestDebugContextAction)
nmap <leader>tt <Action>(RiderUnitTestQuickListPopupAction)
nmap <leader>ta <Action>(RiderUnitTestRunSolutionAction)

vmap <leader>c <Action>(CommentByLineComment)
vmap <C-/> <Action>(CommentByLineComment)
nmap <C-/> <Action>(CommentByLineComment)

nmap gl <Action>(GitLab.Open.In.Browser)
" Tab navigation
map <C-S-t> <Action>(ReopenClosedTab)

map <C-A-j> <Action>(NextOccurence)
map gn <Action>(NextOccurence)
map <C-A-k> <Action>(PreviousOccurence)
map gN <Action>(PreviousOccurence)

nmap <A-p> <Action>(PinActiveTabToggle)
nmap <leader>p <Action>(PinActiveTabToggle)

nmap <leader>rl <Action>(RecentLocations)

nmap <leader>l <Action>(LocateInSolutionView)
nmap <leader>1 <Action>(LocateInSolutionView)
nmap <C-S-L> <Action>(LocateInSolutionView)

nmap <leader>ee <Action>(ChooseRunConfiguration)
nmap <leader>ed <Action>(ChooseDebugConfiguration)
nmap <leader>es <Action>(Stop)

nmap <leader>= <Action>(EditorIncreaseFontSize)
nmap <leader>- <Action>(EditorDecreaseFontSize)
nmap <leader>0 <Action>(EditorResetFontSize)

" nmap <leader>f <Plug>(easymotion-s)
" nmap <leader>e <Plug>(easymotion-f)
" nmap <leader>j <Plug>(easymotion-W)
" nmap <leader>k <Plug>(easymotion-B)

" nmap <leader><leader>f{char}    <Plug>(easymotion-f) "  mapped to fn
" nmap <leader><leader>F{char}    <Plug>(easymotion-F) "  mapped to Fn
" nmap <leader><leader>t{char}    <Plug>(easymotion-t) "  mapped to tn
" nmap <leader><leader>T{char}    <Plug>(easymotion-T) "  mapped to Tn

nmap <leader><leader>w <Plug>(easymotion-w) 
nmap <leader><leader>W <Plug>(easymotion-W) 
nmap <leader><leader>b <Plug>(easymotion-b) "
nmap <leader><leader>B <Plug>(easymotion-B) "
nmap <leader><leader>e <Plug>(easymotion-e) "
nmap <leader><leader>E <Plug>(easymotion-E) "
nmap <leader><leader>ge <Plug>(easymotion-ge) "
nmap <leader><leader>gE <Plug>(easymotion-gE) "
nmap <leader><leader>j <Plug>(easymotion-j) "
nmap <leader><leader>k <Plug>(easymotion-k) "
nmap <leader><leader>n <Plug>(easymotion-n) "
nmap <leader><leader>N <Plug>(easymotion-N) "
nmap <leader><leader>s <Plug>(easymotion-s) 

map <C-M> <S-F10>

map <A-C-S-L> <Action>(IncreaseColumnWidth)
map <A-C-S-H> <Action>(DecreaseColumnWidth)