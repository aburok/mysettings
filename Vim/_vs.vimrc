
" set number " Show line numbers
" https://jeffkreeftmeijer.com/vim-number/
set nonumber


" File {{{
nmap zX :vsc Edit.UndoClose<CR>
nnoremap Q :vsc File.SaveSelectedItems<CR> :vsc File.Close<CR>
" }}}
" Build {{{
nnoremap <leader>Bs :vsc Build.BuildSolution<CR>
nnoremap <leader>Bp :vsc Build.BuildSolution<CR>

nnoremap <leader>s :vsc Debug.Start<CR>
nnoremap <leader>S :vsc Debug.StopDebugging<CR>

" }}}

" Debug {{{
nmap <leader>bd :vsc Debug.DisableAllBreakpoints<CR>
nmap <leader>be :vsc Debug.EnableAllBreakpoints<CR>
nmap <leader>bi :vsc Debug.ToggleBreakpoint<CR>
nmap <leader>bb :vsc Debug.ToggleBreakpoint<CR>

nmap <leader>dw :vsc Debug.AddWatch<CR>
nmap <leader>dn :vsc Debug.StepOver<CR>
nmap <leader>ds :vsc Debug.StepOver<CR>
nmap <leader>di :vsc Debug.StepInto<CR>
nmap <leader>do :vsc Debug.StepOut<CR>
nmap <leader>dc :vsc Debug.CallStack<CR>
nmap <leader>dr :vsc Debug.RunToCursor<CR>

nmap <leader>da :vsc Debug.ReattachtoProcess<CR>
nmap <leader>r1 :vsc Debug.ReAttachHistoryItem1<CR>
" }}}

" TESTS {{{

nnoremap gwt :vsc TestExplorer.ShowTestExplorer<CR>


" }}}

" Search Selected Text {{{
vnoremap // y/<C-R>"<CR>
"    nmap gs :vsc
" }}}

" Navigation {{{

" Visual Studio doesn't work well with switching to next document window
" It does nothing
" nnoremap <Tab> :vsc Window.NextDocumentWindowNav<CR>


" vnoremap <Space> y/<C-R>"<CR>

" Visual Studio doesn't work well with switching to next document window
" It does nothing
" nnoremap <Tab> :vsc Window.NextDocumentWindowNav<CR>


"Find usages
nmap gd :vsc Edit.GoToDefinition<CR>
nmap gi :vsc Edit.GoToImplementation<CR>

nmap <Leader>fl :vsc Favorites.Addalltofavorites<CR>
nmap <Leader>fd :vsc Favorites.Addtofavorites<CR>

noremap gb :vsc View.NavigateBackward<CR>
noremap gf :vsc View.NavigateForward<CR>
noremap gB :vsc View.NavigateForward<CR>
noremap go :vsc View.NavigateForward<CR>
nnoremap <C-o> :vsc View.NavigateBackward<CR>
nnoremap <C-i> :vsc View.NavigateForward<CR>


" Go to Next/prev method"
" In favor of go to member

nnoremap gwd :vsc Window.NextDocumentWindow<CR>
nnoremap gwD :vsc Window.PreviousDocumentWindow<CR>

nnoremap J :vsc Window.PreviousTab<CR>
nnoremap K :vsc Window.NextTab<CR>
nnoremap L :vsc window.NextDocumentWindowNav<CR>

" Go to file / member
" Use same shortcuts as in VS Code
nnoremap <C-p> :vsc Edit.GoToFile<CR>
nnoremap <C-S-p> :vsc Edit.GoToAll<CR>

nnoremap gp : vsc Edit.PeekDefinition <CR>

" SEARCH go to next/prev location"
"" Search
nnoremap gn :vsc Edit.GoToNextLocation<CR>
nnoremap gN :vsc Edit.GoToPrevLocation<CR>

nmap ge :vsc Edit.GoToNextIssueinFile<CR>
nmap gE :vsc Edit.GoToPreviousIssueinFile<CR>


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

nmap <leader>ef :vsc Edit.FormatDocument<CR>

nmap <leader>cp :vsc File.CopyFullPath<CR>
nnoremap <leader>yp :vsc File.CopyFullPath<CR>
" }}}

nmap <leader>ac :vsc Project.AddClass<CR>
nmap <leader>ai :vsc Project.AddInterface<CR>
nmap <leader>ar :vsc Project.AddReference<CR>
" }}}


" Views {{{
nmap gwc :vsc Debug.CallStack<CR>
" nmap gwd :vsc Debug.Watch1<CR> In favour of go to next document
nmap gwe :vsc View.ErrorList<CR>

nmap gwn :vsc Project.ManageNuGetPackages<CR>
nmap gwo :vsc View.Output<CR>
nmap gwp :vsc View.PackageManagerConsole<CR>
nmap gws :vsc View.SolutionExplorer<CR>

" }}}

" Window Managment {{{

nnoremap <Leader>ws :vsc Window.Split<CR>
nnoremap <Leader>wc :vsc Window.Split<CR>
nnoremap <Leader>wC :vsc Window.CloseDocumentWindow<CR>
nnoremap <Leader>wf :vsc Window.Float<CR>
nnoremap <Leader>wF :vsc Window.MoveToMainDocumentGroup<CR>
nnoremap <Leader>wj :vsc Window.NextSplitPane<CR>
nnoremap <Leader>wk :vsc Window.PreviousSplitPane<CR>

nnoremap <Leader>wN :vsc Window.MovetoPreviousTabGroup<CR>
nnoremap <Leader>wn :vsc Window.MovetoNextTabGroup<CR>
nnoremap <Leader>wh :vsc Window.NewHorizontalTabGroup<CR>
nnoremap <Leader>wv :vsc Window.NewVerticalTabGroup<CR>

nmap <leader>wd :vsc Window.NewWindow<CR>
" }}}


nmap <leader>w :vsc View.BlockSelection<CR>

noremap <C-S-Space> :vsc Edit.ParameterInfo<CR>
" }}}

" MVC {{{
nnoremap gv :vsc EditorContextMenus.CodeWindow.GoToView<CR>
nnoremap gc :vsc OtherContextMenus.HTMLContext.GoToController<CR>

nnoremap <Leader>av :vsc EditorContextMenus.CodeWindow.AddView<CR>
" }}}

nmap <Leader>ap :vsc Tools.AttachtoProcess<CR>

nmap <leader>p :vsc Window.PinTab<CR>

nmap <leader>q :vsc Window.CloseDocumentWindow<CR>

nmap gc :vsc View.ViewCode<CR>

" ARDUINO
" nmap <Leader>mb :vsc VisualMicro.SketchCompileUpload<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""
" PEASY MOTION - vim-easymotion plugin for Visual Studio
" gS prefix is added for ViEmu, no use for VsVim AFAIK.
"VsVim and ViEmu are disabled until PeasyMotion finishes

"Whole viewport jump-to-word beginning mode:
nnoremap <leader><leader> gS:vsc Tools.InvokePeasyMotion<CR>

"Select text from current caret position to desired jump label (fwd and reverse directions supported)
nmap <leader>v gS:vsc Tools.InvokePeasyMotionTextSelect<CR>

"Jump to word beginning in current line
nmap zw gS:vsc Tools.InvokePeasyMotionLineJumpToWordBegining<CR>
"Jump to word ending in current line
nmap ze gS:vsc Tools.InvokePeasyMotionLineJumpToWordEnding<CR>

"Jump to any open document tab
" nmap ;w gS:vsc Tools.InvokePeasyMotionJumpToDocumentTab<CR>

"Jump to line beginning:
" nmap ;l gS:vsc Tools.InvokePeasyMotionJumpToLineBegining<CR>

"Two char search mode:
" nmap ;c gS:vsc Tools.InvokePeasyMotionTwoCharJump<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""