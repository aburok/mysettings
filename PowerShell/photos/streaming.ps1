function Take-StreamScreenshot([string] $path, [string] $pass, [string] $address){
    $command = ".\ffmpeg.exe -i rtsp://admin:{0}@{1}:554/cam/realmonitor?channel={2}"&"subtype=0 -frames:v 1 -f image2 -r 1 -y img{2}.jpg"

    for($channel = 1; $channel -le 8; $channel++){
        $cmd = ($command -f $pass, $address, $channel)
    Invoke-Expression $cmd
    }

}
