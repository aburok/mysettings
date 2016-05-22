function git-pushDev {
    $branchName = git-branchName
    Write-Info "Pushing changes from '${branchName}' to env-dev."
    git push -u origin $branchName:env-dev
}

function git-pushStaging {
    $branchName = git-branchName
    Write-Info "Pushing changes from '${branchName}' to env-staging."
    git push -u origin $branchName:env-staging
}

Set-alias -Name gtped -Value git-pushDev
Set-Alias -Name gtpes -Value git-pushStaging
