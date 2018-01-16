
# Setting Aliases
# Write-Host "Adding aliases for $($global:myCommands.count)"

$global:myCommands `
    | Sort-Object -Property alias `
    | ForEach { 
        # Write-Host "Adding alias for $($_.alias) for command $($_.command) ..."
        Set-Alias -Name $_.alias -Value $_.command 
    }


