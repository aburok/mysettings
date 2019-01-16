gvim(file){
    Run, C:\Dropbox\Tools\vim73-zlib-win32\gvim.exe -p --remote-tab-silent %file% `%*
}

FindLatestFileAndOpen(path, filePattern){
    global 

    Loop %path%\%filePattern%
    If ( A_LoopFileTimeModified >= Time )
        Time := A_LoopFileTimeModified, File := A_LoopFileLongPath

    IF (File = ""){
        MsgBox, Could not find any file in path %path%
    }
    else{
        MsgBox, File found %File%
        gvim(File)
    }
}

ReturnFirstExistingFile(FileList){
    Loop , parse, FileList, `,
    {
        isFile := FileExist(A_LoopField)
        if (isFile){
            return %A_LoopField%
        }
    }
    return
}