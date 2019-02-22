HandleIIs()
{
    ; TODO :
    ; Add command to list all aplications from applicationHost.config
    ; TODO:
    ; Add opening the log file for application
    INPUT, command, T2 L1

    if ("c" = command){
        Run %windir%\system32\inetsrv\config\applicationHost.config
    } else if ("a" = command){

        }
        return
}
