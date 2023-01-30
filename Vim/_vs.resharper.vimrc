
nnoremap <Leader>tr :vsc ReSharper.ReSharper_UnitTestRunContext<CR>
nnoremap <Leader>ta :vsc ReSharper.ReSharper_UnitTestRunSolution<CR>
nnoremap <Leader>ts :vsc ReSharper.ReSharper_UnitTestRunCurrentSession<CR>


nnoremap % :vsc Resharper_GoToBrace<CR>

nnoremap <leader>Rs :vsc ReSharper_Suspend<CR>
nnoremap <leader>Rd :vsc ReSharper_Suspend<CR>
nnoremap <leader>Rr :vsc ReSharper_Resume<CR>
nnoremap <leader>Re :vsc ReSharper_Resume<CR>
nnoremap <leader>RD :vsc ReSharper_Resume<CR>


"Find usages
nmap <Leader>fu :vsc ReSharper.ReSharper_FindUsages<CR>
nmap <Leader>ff :vsc ReSharper.ReSharper_FindUsages<CR>
nmap <Leader>fi :vsc ReSharper.ReSharper_GotoImplementation<CR>
nmap gI :vsc ReSharper.ReSharper_GotoInheritors<CR>

nmap <leader>N :vsc ReSharper.ReSharper_NavigateTo<CR>
noremap g; :vsc ReSharper.ReSharper_GotoLastEditLocation<CR>

nnoremap <Leader>gd :vsc ReSharper.ReSharper_GoToContainingDeclaration<CR>

" Go to Next/prev method"
" In favor of go to member
nmap gm :vsc ReSharper.ReSharper_GotoNextMember<CR>
nnoremap <M-j> :vsc ReSharper.ReSharper_GotoNextMember<CR>

nmap gM :vsc ReSharper.ReSharper_GotoPrevMember<CR>
nnoremap <M-k> :vsc ReSharper.ReSharper_GotoPrevMember<CR>

nmap gl :vsc ReSharper.ReSharper_GotoFile<CR>
nmap <C-P> :vsc ReSharper.ReSharper_GotoType<CR>
nmap <C-S-P> :vsc ReSharper.ReSharper_GotoType<CR>
nmap gm :vsc ReSharper.ReSharper_GotoFileMember<CR>
nnoremap gr :vsc ReSharper.ReSharper_GotoRecentFiles <CR>
nnoremap gR :vsc ReSharper.ReSharper_GotoRelatedFiles <return>

" SEARCH go to next/prev location"
"" Search
nnoremap gl :vsc ReSharper.ReSharper_ResultList_GoToNextLocation<CR>
nnoremap gL :vsc ReSharper.ReSharper_ResultList_GoToPrevLocation<CR>
nmap gwf :vsc Resharper.Resharper_ShowFindResults<CR>

" Go To Next Error in Solution"
nmap ge :vsc ReSharper.ReSharper_GotoNextErrorInSolution<CR>
noremap <C-E> :vsc ReSharper.ReSharper_GotoNextErrorInSolution<CR>
nmap gE :vsc ReSharper.ReSharper_GotoPrevErrorInSolution<CR>

"GO to Next/prev code issue"
nmap gh :vsc ReSharper.ReSharper_GotoNextHighlight<CR>
nmap <C-;> :vsc ReSharper.ReSharper_GotoNextHighlight<CR>
nmap gH :vsc ReSharper.ReSharper_GotoPrevHighlight<CR>
nmap <C-S-;> :vsc ReSharper.ReSharper_GotoPrevHighlight<CR>

nmap gt :vsc ReSharper.ReSharper_GotoType<CR>
"}}}


" Move Code Right / Down / Up / Left
nmap <Leader>H :vsc ReSharper.ReSharper_MoveLeft<CR>
nmap <Leader>J :vsc ReSharper.ReSharper_MoveDown<CR>
nmap <Leader>K :vsc ReSharper.ReSharper_MoveUp<CR>
nmap <Leader>L :vsc ReSharper.ReSharper_MoveRight<CR>

nmap <Leader>ed :vsc ReSharper.ReSharper_DuplicateText<CR>
vmap <Leader>ed :vsc ReSharper.ReSharper_DuplicateText<CR>

nnoremap <leader>yt :vsc ReSharper.ReSharper_CopyFqn<CR>
" }}}

" Refactorings {{{
nmap <leader>re :vsc ReSharper.ReSharper_Rename<CR>
nmap <leader>R :vsc ReSharper.ReSharper_RefactorThis<CR>
vmap <leader>R :vsc ReSharper.ReSharper_RefactorThis<CR>
vmap <leader>em :vsc ReSharper.ReSharper_ExtractMethod<CR>

" nmap <leader>ei :vsc ReSharper.ReSharper_ExtractInter<CR>
nmap <leader>ei :vsc Refactor.ExtractInterface<CR>

vmap <leader>if :vsc ReSharper.ReSharper_IntroduceField<CR>
vmap <leader>ip :vsc ReSharper.ReSharper_IntroParameter<CR>
vmap <leader>iv :vsc ReSharper.ReSharper_IntroVariable<CR>

nmap <leader>if vaW:vsc ReSharper.ReSharper_IntroduceField<CR>
nmap <leader>iv vaW:vsc ReSharper.ReSharper_IntroVariable<CR>
nmap <leader>ip vaW:vsc ReSharper.ReSharper_IntroParameter<CR>

nmap <leader>ac :vsc Project.AddClass<CR>
nmap <leader>ai :vsc Project.AddInterface<CR>
nmap <leader>ar :vsc Project.AddReference<CR>
" }}}

" Live templates {{{
nmap <leader>ti :vsc ReSharper.ReSharper_LiveTemplates_Insert<CR>
vmap <leader>s :vsc ReSharper.ReSharper_SurroundWith<CR>
nmap <leader>tf :vsc ReSharper.ReSharper_GenerateFileBesides<CR>
" }}}


nmap gs :vsc ReSharper.ReSharper_LocateInSolutionExplorer<CR>

" Visual {{{
vnoremap at :vsc ReSharper.ReSharper_SelectContainingDeclaration<CR>
"nmap zsw :vsc Edit.SelectCurrentWord<CR>

vmap <leader>w :vsc ReSharper.ReSharper_ExtendSelection<CR>
nmap <leader>W :vsc ReSharper.ReSharper_ShrinkSelection<CR>
vmap <leader>W :vsc ReSharper.ReSharper_ShrinkSelection<CR>
noremap <C-W> :vsc ReSharper.ReSharper_ExtendSelection<CR>
noremap <C-S-W> :vsc ReSharper.ReSharper_ShrinkSelection<CR>


nnoremap gk :vsc ReSharper.ReSharper_BookmarksBookmarksMenu <CR>
nnoremap g1 :vsc ReSharper.ReSharper_BookmarksGoToBookmark1 <CR>
nnoremap g2 :vsc ReSharper.ReSharper_BookmarksGoToBookmark2 <CR>
nnoremap g3 :vsc ReSharper.ReSharper_BookmarksGoToBookmark3 <CR>
nnoremap g4 :vsc ReSharper.ReSharper_BookmarksGoToBookmark4 <CR>
nnoremap g5 :vsc ReSharper.ReSharper_BookmarksGoToBookmark5 <CR>
