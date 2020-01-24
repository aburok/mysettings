# Register-EngineEvent PowerShell.Exiting -Action {
#     if ($global:poshSettings.lastDirectory) {
#         $global:poshSettings.lastDirectory = (Get-Item -Path ".\" -Verbose).FullName
#         save-poshsettings
#     }
# } > $null

# Function Set-Location {
#     [CmdletBinding()]
#     param(
#         [string] $Path,
#         [switch] $PassThru,
#         [switch] $UseTransaction
#     )

#     Microsoft.PowerShell.Management\Set-Location `
#         -Path $Path `
#         -PassThru:$PassThru `
#         -UseTransaction:$UseTransaction

#     $global:poshSettings.lastDirectory = (Get-Item -Path ".\" -Verbose).FullName
#     save-poshsettings
# }

# Set-Alias -Name "cd" -Value