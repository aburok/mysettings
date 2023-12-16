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

" https://github.com/AlexPl292/IdeaVim-EasyMotion#setup
Plugin 'easymotion/vim-easymotion'
Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'vim-easymotion'
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

Plug 'easymotion/vim-easymotion'

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
sethandler <C-F> n-v:vim
sethandler <C-H> n-v:vim
sethandler <C-I> n-v:vim
sethandler <C-J> n-v:vim
sethandler <C-K> n-v:vim
sethandler <C-L> a:vim
sethandler <C-M> n-v:vim
sethandler <C-O> i-v:vim
sethandler <C-Q> i-v:videvm
sethandler <C-p> a:vim
sethandler <C-t> n-v:vim
sethandler <C-w> n-v:vim
sethandler <C-S-A> i-v:vim
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
sethandler <A-3> a:vim
sethandler <A-6> a:vim

map <C-S-A> <Action>(EditorSelectWord)

""" Mappings --------------------------------
nmap <leader>d <Action>(Debug)
nmap <leader>rr <Action>(RenameElement)
nmap <leader>c <Action>(Stop)
nmap <leader>z <Action>(ToggleDistractionFreeMode)

" map <leader>s <Action>(SelectInProjectView)
nmap <leader>ga <Action>(Annotate)
nmap <leader>gh <Action>(Vcs.ShowTabbedFileHistory)
nmap <leader>gd <Action>(Compare.SameVersion)
nmap <leader>gs <Action>(FileStructurePopup)
nmap <leader>m <Action>(FileStructurePopup)

map <A-K1> <Action>(Resume)
map <A-`> <Action>(ActivateTerminalToolWindow)
map <A-S-1> <Action>(ActivateTerminalToolWindow)
map <A-2> <Action>(ActivateUnitTestsToolWindow)
map <A-S-3> <Action>(ActivateNuGetToolWindow)
map <A-S-2> <Action>(ActivateBookmarksToolWindow)

map <S-Space> <Action>(ShowErrorDescription)
map <C-S-Space> <Action>(ParameterInfo)

map <C-S-e> <Action>(ActivateProjectToolWindow)
map <leader>we <Action>(ActivateProjectToolWindow)

nmap ge <Action>(ReSharperGotoNextErrorInSolution)
nmap gE <Action>(ReSharperGotoPrevErrorInSolution)

nmap <leader>bb <Action>(ToggleLineBreakpoint)
nmap <leader>be <Action>(EditBreakpoint)
nmap <leader>bt <Action>(XDebugger.MuteBreakpoints)

nmap <leader>u <Action>(FindUsages)
nmap <leader>i <Action>(GotoImplementation)
nmap gi <Action>(GotoImplementation)

map <C-o> <Action>(Back)
nmap H <Action>(Back)
map <C-i> <Action>(Forward)
nmap L <Action>(Forward)

map <C-S-j> <Action>(VcsShowNextChangeMarker)
map <C-S-k> <Action>(VcsShowPrevChangeMarker)

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
nmap gr <Action>(RecentFiles)
nmap <leader>aa <Action>(ShowIntentionActions)
nmap <leader>ar <Action>(RefactoringMenu)
nmap <C-e> <Action>(EditorSelectWord)

" MOVE BETWEEN SPLITS
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

nmap <leader>ws <Action>(SplitHorizontally)
map <A-_> <Action>(SplitHorizontally)
nmap <leader>wv <Action>(SplitVertically)
map <A-+> <Action>(SplitVertically)
nmap <leader>wu <Action>(Unsplit)
nmap <leader>wc <Action>(ChangeSplitOrientation)
nmap <leader>wr <Action>(MoveTabRight)
nmap <leader>wd <Action>(MoveTabDown)

nmap <leader>ww <Action>(MoveEditorToOppositeTabGroup)
nmap <leader>wt <Action>(MoveEditorToOppositeTabGroup)

vmap <leader>ss <Action>(SurroundWith)
vmap <leader>sl <Action>(SurroundWithLiveTemplate)

nmap <leader>oo <Action>(ReformatCode)
map <C-A-F> <Action>(ReformatCode)

"""""""""""""""""
""" BOOKMARKS """
nmap mm <Action>(ToggleBookmark)
nmap mn <Action>(ToggleBookmarkWithMnemonic)
nmap mx <Action>(DeleteMnemonicFromBookmark)
nmap '' <Action>(ShowBookmarks)
nmap 'j <Action>(GotoNextBookmark)
nmap 'k <Action>(GotoPreviousBookmark)

" Q W E R T Y U I O P 
nmap mq <Action>(ToggleBookmarkQ)
nmap 'q <Action>(GotoBookmarkQ)
nmap mw <Action>(ToggleBookmarkW)
nmap 'w <Action>(GotoBookmarkW)
nmap me <Action>(ToggleBookmarkE)
nmap 'e <Action>(GotoBookmarkE)
nmap mr <Action>(ToggleBookmarkR)
nmap 'r <Action>(GotoBookmarkR)
nmap mt <Action>(ToggleBookmarkT)
nmap 't <Action>(GotoBookmarkT)
nmap my <Action>(ToggleBookmarkY)
nmap 'y <Action>(GotoBookmarkY)
nmap mu <Action>(ToggleBookmarkU)
nmap 'u <Action>(GotoBookmarkU)
nmap mi <Action>(ToggleBookmarkI)
nmap 'i <Action>(GotoBookmarkI)
nmap mo <Action>(ToggleBookmarkO)
nmap 'o <Action>(GotoBookmarkO)
nmap mp <Action>(ToggleBookmarkP)
nmap 'p <Action>(GotoBookmarkP)

" A S D F G H J K
nmap ma <Action>(ToggleBookmarkA)
nmap 'a <Action>(GotoBookmarkA)
nmap ms <Action>(ToggleBookmarkS)
nmap 's <Action>(GotoBookmarkS)
nmap md <Action>(ToggleBookmarkD)
nmap 'd <Action>(GotoBookmarkD)
nmap mf <Action>(ToggleBookmarkF)
nmap 'f <Action>(GotoBookmarkF)
nmap mg <Action>(ToggleBookmarkG)
nmap 'g <Action>(GotoBookmarkG)
nmap mh <Action>(ToggleBookmarkH)
nmap 'h <Action>(GotoBookmarkH)
nmap mj <Action>(ToggleBookmarkJ)
nmap 'j <Action>(GotoBookmarkJ)
nmap mk <Action>(ToggleBookmarkK)
nmap 'k <Action>(GotoBookmarkK)
nmap ml <Action>(ToggleBookmarkL)
nmap 'l <Action>(GotoBookmarkL)

" Z C V
nmap mz <Action>(ToggleBookmarkZ)
nmap 'z <Action>(GotoBookmarkZ)
nmap mc <Action>(ToggleBookmarkC)
nmap 'c <Action>(GotoBookmarkC)
nmap mv <Action>(ToggleBookmarkV)
nmap 'v <Action>(GotoBookmarkV)
nmap mb <Action>(ToggleBookmarkB)
nmap 'b <Action>(GotoBookmarkB)
nmap mn <Action>(ToggleBookmarkN)
nmap 'n <Action>(GoToBookmarkN)

""" END : BOOKMARKS """
"""""""""""""""""""""""

nmap <leader>tr <Action>(RiderUnitTestRunContextAction)
nmap <leader>td <Action>(RiderUnitTestDebugContextAction)
nmap <leader>tt <Action>(RiderUnitTestQuickListPopupAction)
nmap <leader>ta <Action>(RiderUnitTestRunSolutionAction)

vmap <leader>c <Action>(CommentByLineComment)
vmap <C-/> <Action>(CommentByLineComment)
nmap <C-/> <Action>(CommentByLineComment)

" Tab navigation
map <C-S-t> <Action>(ReopenClosedTab)

map <C-j> <Action>(MethodDown)
map <C-k> <Action>(MethodUp)

map <C-A-j> <Action>(NextOccurence)
map gn <Action>(NextOccurence)
map <C-A-k> <Action>(PreviousOccurence)
map gN <Action>(PreviousOccurence)

nmap <A-p> <Action>(PinActiveTabToggle)
nmap <leader>p <Action>(PinActiveTabToggle)

nmap <leader>rl <Action>(RecentLocations)

nmap <leader>l <Action>(LocateInSolutionView)
nmap <C-S-L> <Action>(LocateInSolutionView)

nmap <leader>ee <Action>(ChooseRunConfiguration)
nmap <leader>ed <Action>(ChooseDebugConfiguration)
nmap <leader>es <Action>(Stop)

nmap <leader>= <Action>(EditorIncreaseFontSize)
nmap <leader>- <Action>(EditorDecreaseFontSize)
nmap <leader>0 <Action>(EditorResetFontSize)

" nmap <leader>f <Plug>(easymotion-s)
" nmap <leader>e <Plug>(easymotion-f)
nmap <leader>j <Plug>(easymotion-W)
nmap <leader>k <Plug>(easymotion-B)

nmap <leader><leader>f{char}    <Plug>(easymotion-f) "  mapped to fn
nmap <leader><leader>F{char}    <Plug>(easymotion-F) "  mapped to Fn
nmap <leader><leader>t{char}    <Plug>(easymotion-t) "  mapped to tn
nmap <leader><leader>T{char}    <Plug>(easymotion-T) "  mapped to Tn

nmap <leader><leader>w <Plug>(easymotion-w) "
nmap <leader><leader>W <Plug>(easymotion-W) "
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