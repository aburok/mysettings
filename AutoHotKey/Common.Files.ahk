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