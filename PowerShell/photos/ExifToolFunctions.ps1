$exifTool = ' C:\Dropbox\Tools\advanced_renamer_portable\exiftool.exe '


function Exif-RestoreOriginal{
    Invoke-Expression "$exifTool -restore_original ."
}

function Exif-DeleteOriginal{
    Write-Host "Deleting original files ..."
    Invoke-Expression "$exifTool -delete_original ."
}

function Exif-ShowAllDates{
    Get-ChildItem .  -Filter "*.jpg" |
    Select-Object -First 5 |
    ForEach-Object {
        Write-Host "==================================="
        Write-Host "Date propertis for $_"
        Invoke-Expression "$exifTool -a -u -g1 $_" } |
    Select-String -SimpleMatch "date" 
}

function Exif-ChangeTimeFileModified(
    [string] $fieldToChange,
    [string] $addTimeDelta, [string] $subTimeDelta) {
    Write-Host "Changing Date Time for attribiute : $fieldToChange"
    if($addTimeDelta){
        Write-Host "adding time delta to the $fieldToChange"
        Invoke-Expression "$exifTool '-$fieldToChange+=$addTimeDelta' ."
    }
    if ($subTimeDelta){
        Write-Host "substrating time delta from the $fieldToChange "
        Invoke-Expression "$exifTool '-$fieldToChange-=$subTimeDelta' ."
    }
}

function Exif-FileNameFormat{
    Write-Host "Formatting all file names base on DateTimeOriginal."
    Invoke-Expression "$exifTool '-filename<DateTimeOriginal' -d %Y-%m-%d_%H-%M-%S%%-c.%%e . "
}

function Exif-SetDateTimeOriginal{
    Write-Host "Setting DateTimeOriginal, -ModifyDate and -CreateDate from FileCreateDate"
    Invoke-Expression "$exifTool -DateTimeOriginal<FileCreateDate ."
    Invoke-Expression "$exifTool -ModifyDate<FileCreateDate ."
    Invoke-Expression "$exifTool -CreateDate<FileCreateDate ."
}

function Exif-FindNoDateTimeOriginal {
    Invoke-Expression "$exifTool -filename -filemodifydate -createdate -r -if '(not $$datetimeoriginal) and $$filetype eq ""JPG""' . "
}

function Exif-SetAllTimes([string] $dateTime){
    Invoke-Expression "$exifTool '-AllDates=$dateTime' . "
}

function Exif-SetTimeAndRename([string] $addDateTime, [string] $subDateTime,
    [switch] $fromOriginal, [switch] $changeOriginalDate){

    if($changeOriginalDate){
        $attrToChange = "DateTimeOriginal"
    } else {
        $attrToChange = "FileCreateDate"
    }
    Exif-ChangeTimeFileModified -addTimeDelta $addDateTime -subTimeDelta $subDateTime -fieldToChange $attrToChange

    if(!($fromOriginal.IsPresent)){
        Exif-SetDateTimeOriginal
    }

    Exif-FileNameFormat

    Exif-DeleteOriginal
}