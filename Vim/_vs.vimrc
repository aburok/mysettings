
" Ctrl + Alt + I - ReSharper generate file beside
" Ctrl + Alt + S - Resharper surrand with template

" File {{{
    nmap zX :vsc Edit.UndoClose<CR>
    nnoremap Q :vsc File.SaveSelectedItems<CR> :vsc File.Close<CR>
" }}}
" Build {{{
    nnoremap <leader>B :vsc Build.BuildSolution<CR>

    nnoremap <leader>s :vsc Debug.Start<CR>
    nnoremap <leader>S :vsc Debug.StopDebugging<CR>

" }}}

" Debug {{{
	nmap <leader>bd :vsc Debug.DisableAllBreakpoints<CR>
	nmap <leader>be :vsc Debug.EnableAllBreakpoints<CR>
	nmap <leader>bi :vsc Debug.ToggleBreakpoint<CR>
	nmap <leader>bb :vsc Debug.ToggleBreakpoint<CR>

    map <leader>dw :vsc Debug.AddWatch<CR>

    nmap <leader>ra :vsc Debug.ReAttach<CR>
    nmap <leader>r1 :vsc Debug.ReAttachHistoryItem1<CR>
" }}}

" TESTS {{{

nnoremap gwt :vsc TestExplorer.ShowTestExplorer<CR>

nnoremap <Leader>tr :vsc ReSharper.ReSharper_UnitTestRunContext<CR>
nnoremap <Leader>ta :vsc ReSharper.ReSharper_UnitTestRunSolution<CR>
nnoremap <Leader>ts :vsc ReSharper.ReSharper_UnitTestRunCurrentSession<CR>

" }}}

" Search Selected Text {{{
	vnoremap // y/<C-R>"<CR>
"    nmap gs :vsc
" }}}

" Navigation {{{

  "  nnoremap <Space> :vsc Edit.Find<CR>
    nnoremap <Space><space> viw:vsc Resharper.Resharper_GotoType<CR>
    nnoremap <Space>' vi':vsc Resharper.Resharper_GotoType<CR>
    nnoremap <Space>" vi":vsc Resharper.Resharper_GotoType<CR>
    nnoremap <Space>{ vi{:vsc Resharper.Resharper_GotoType<CR>
    nnoremap <Space>9 vi(:vsc Resharper.Resharper_GotoType<CR>
	" vnoremap <Space> y<ESC>/<C-R>"<CR>
	vnoremap <Space> :vsc Resharper.Resharper_GotoType<CR>

nnoremap % :vsc Resharper_GoToBrace<CR>


    " Visual Studio doesn't work well with switching to next document window
    " It does nothing
    " nnoremap <Tab> :vsc Window.NextDocumentWindowNav<CR>


	" vnoremap <Space> y/<C-R>"<CR>

    " Visual Studio doesn't work well with switching to next document window
    " It does nothing
    " nnoremap <Tab> :vsc Window.NextDocumentWindowNav<CR>


    "Find usages
    nmap <Leader>fu :vsc ReSharper.ReSharper_FindUsages<CR>
    nmap <Leader>ff :vsc ReSharper.ReSharper_FindUsages<CR>
	nmap <Leader>fi :vsc ReSharper.ReSharper_GotoImplementation<CR>
    nmap gd :vsc ReSharper.ReSharper_GotoDeclaration<CR>
    nmap gI :vsc ReSharper.ReSharper_GotoInheritors<CR>
    nmap gi :vsc ReSharper.ReSharper_GotoImplementation<CR>

	nmap <Leader>fl :vsc Favorites.Addalltofavorites<CR>
	nmap <Leader>fd :vsc Favorites.Addtofavorites<CR>

	nmap <leader>N :vsc ReSharper.ReSharper_NavigateTo<CR>
    noremap gb :vsc View.NavigateBackward<CR>
    noremap g; :vsc ReSharper.ReSharper_GotoLastEditLocation<CR>
    noremap gB :vsc View.NavigateForward<CR>
    noremap go :vsc View.NavigateForward<CR>
    noremap g, :vsc View.NavigateForward<CR>
    nnoremap <C-o> :vsc View.NavigateBackward<CR>
    nnoremap <C-i> :vsc View.NavigateForward<CR>

	nnoremap <Leader>gd :vsc ReSharper.ReSharper_GoToContainingDeclaration<CR>

	" Go to Next/prev method"
    " In favor of go to member
	nmap gm :vsc ReSharper.ReSharper_GotoNextMethod<CR>
    nnoremap <M-j> :vsc ReSharper.ReSharper_GotoNextMethod<CR>

    nmap gM :vsc ReSharper.ReSharper_GotoPrevMethod<CR>
    nnoremap <M-k> :vsc ReSharper.ReSharper_GotoPrevMethod<CR>

    nnoremap gwd :vsc Window.NextDocumentWindow<CR>
    nnoremap gwD :vsc Window.PreviousDocumentWindow<CR>

    nnoremap J :vsc Window.PreviousTab<CR>
    nnoremap K :vsc Window.NextTab<CR>
    nnoremap L :vsc window.NextDocumentWindowNav<CR>

    " Go to file / member
    nmap gf :vsc ReSharper.ReSharper_GotoFile<CR>
    nnoremap <C-P> :vsc ReSharper.ReSharper_GotoFile<CR>
    nmap gm :vsc ReSharper.ReSharper_GotoFileMember<CR>
    nnoremap gr :vsc ReSharper.ReSharper_GotoRecentFiles <CR>
    nnoremap gR :vsc ReSharper.ReSharper_GotoRelatedFiles <return>


    " go to next/prev location"
    nnoremap gl :vsc ReSharper.ReSharper_ResultList_GoToNextLocation<CR>
    nnoremap gL :vsc ReSharper.ReSharper_ResultList_GoToPrevLocation<CR>

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


" Code View {{{
    nnoremap <leader>fm :vsc Edit.CollapsetoDefinitions<CR>
    nnoremap <leader>fa :vsc Edit.ToggleAllOutlining<CR>
    nnoremap <leader>ft :vsc Edit.ToggleOutliningExpansion<CR>

    nmap <Leader>ww :vsc Edit.ToggleWordWrap<CR>
" }}}

" Code Edit {{{
    nnoremap <Leader>cc :vsc Edit.CommentSelection<CR>
    vnoremap <Leader>cc :vsc Edit.CommentSelection<CR>
    vnoremap <Leader>cC :vsc Edit.UncommentSelection<CR>
    nnoremap <Leader>cC :vsc Edit.UncommentSelection<CR>
    nnoremap <Leader>cu :vsc Edit.UncommentSelection<CR>
    vnoremap <Leader>cu :vsc Edit.UncommentSelection<CR>

    " Move Code Right / Down / Up / Left
    nmap <Leader>H :vsc ReSharper.ReSharper_MoveLeft<CR>
    nmap <Leader>J :vsc ReSharper.ReSharper_MoveDown<CR>
    nmap <Leader>K :vsc ReSharper.ReSharper_MoveUp<CR>
    nmap <Leader>L :vsc ReSharper.ReSharper_MoveRight<CR>

    nmap <Leader>ed :vsc ReSharper.ReSharper_DuplicateText<CR>
    vmap <Leader>ed :vsc ReSharper.ReSharper_DuplicateText<CR>

    nmap <leader>ef :vsc Edit.FormatDocument<CR>

    nmap <leader>cp :vsc File.CopyFullPath<CR>
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


" Views {{{
    nmap gwc :vsc Debug.CallStack<CR>
    " nmap gwd :vsc Debug.Watch1<CR> In favour of go to next document
    nmap gwe :vsc View.ErrorList<CR>
    nmap gwf :vsc View.FindResults1<CR>

    nmap gwn :vsc Project.ManageNuGetPackages<CR>
	nmap gwo :vsc View.Output<CR>
	nmap gwp :vsc View.PackageManagerConsole<CR>
	nmap gws :vsc View.SolutionExplorer<CR>

    nmap gs :vsc ReSharper.ReSharper_LocateInSolutionExplorer<CR>

" }}}

" Window Managment {{{

    nnoremap <Leader>ws :vsc Window.Split<cr>
    nnoremap <Leader>wc :vsc Window.Split<cr>
    nnoremap <Leader>wC :vsc Window.CloseDocumentWindow<cr>
    nnoremap <Leader>wf :vsc Window.Float<cr>
    nnoremap <Leader>wF :vsc Window.MoveToMainDocumentGroup<cr>
    nnoremap <Leader>wj :vsc Window.NextSplitPane<cr>
    nnoremap <Leader>wk :vsc Window.PreviousSplitPane<cr>

    nnoremap <Leader>wN :vsc Window.MovetoPreviousTabGroup<cr>
    nnoremap <Leader>wn :vsc Window.MovetoNextTabGroup<cr>
    nnoremap <Leader>wh :vsc Window.NewHorizontalTabGroup<CR>
    nnoremap <Leader>wv :vsc Window.NewVerticalTabGroup<CR>

    nmap <leader>wd :vsc Window.NewWindow<CR>
" }}}


" Visual {{{
    vnoremap at :vsc ReSharper.ReSharper_SelectContainingDeclaration<CR>
    "nmap zsw :vsc Edit.SelectCurrentWord<CR>

    nmap <leader>w :vsc ReSharper.ReSharper_ExtendSelection<CR>
    vmap <leader>w :vsc ReSharper.ReSharper_ExtendSelection<CR>
    nmap <leader>W :vsc ReSharper.ReSharper_ShrinkSelection<CR>
    vmap <leader>W :vsc ReSharper.ReSharper_ShrinkSelection<CR>
    noremap <C-W> :vsc ReSharper.ReSharper_ExtendSelection<CR>
    noremap <C-S-W> :vsc ReSharper.ReSharper_ShrinkSelection<CR>

    " noremap <C-S-Space> :vsc Edit.ParameterInfo<CR>
    nnoremap <S-Space> :vsc Resharper.Resharper_ParameterInfoShow<CR>
" }}}

" MVC {{{
    nnoremap <leader>gv :vsc EditorContextMenus.CodeWindow.GoToView<CR>
    nnoremap <Leader>gc :vsc OtherContextMenus.HTMLContext.GoToController<CR>

    nnoremap <Leader>av :vsc EditorContextMenus.CodeWindow.AddView<CR>
" }}}

nmap <Leader>ap :vsc Tools.AttachtoProcess<CR>

nmap <leader>p :vsc Window.PinTab<CR>

nmap <leader>q :vsc Window.CloseDocumentWindow<CR>

nmap gc :vsc View.ViewCode<CR>

" ARDUINO
nmap <Leader>mb :vsc VisualMicro.SketchCompileUpload<CR>
