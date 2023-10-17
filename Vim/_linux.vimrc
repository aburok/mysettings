" This automatically copies yanked text into Clipboard of windows 
" https://stackoverflow.com/questions/44480829/how-to-copy-to-clipboard-in-vim-of-bash-on-windows
" 
autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')

nnoremap <C-v>		    "+gp

