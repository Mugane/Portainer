# Windows Powershell Watch Script:
# Monitors for changes and runs the collate.sh script to build templates.yml
# To enable, 
# 1. Run a docker linux container `portemp` to serve the templates.json file using the git bash command:
#    docker run -d -v $(pwd):/usr/share/nginx/html:ro -p 8080:80 --name portemp nginx:latest
# 2. Start PowerShell as Admin and run:
#    Set-ExecutionPolicy RemoteSigned -Scope Process
#    .\monitor.ps1

$global:ContainerName = 'portemp' # The Docker container name (where the repo is mounted for building)
$global:CollatePath = '/usr/share/nginx/html' # The collate script path inside the container

$watcher = New-Object System.IO.FileSystemWatcher -Property @{
    Path = $PSScriptRoot + "\templates" # The path to watch for changes, derived from the script's directory and appending '\templates'
    IncludeSubdirectories = $true
    NotifyFilter = [System.IO.NotifyFilters]::LastAccess -bor 
                    [System.IO.NotifyFilters]::LastWrite -bor 
                    [System.IO.NotifyFilters]::FileName -bor 
                    [System.IO.NotifyFilters]::DirectoryName
}

Register-ObjectEvent $watcher Changed -Action {
    $containerStatus = docker inspect -f '{{.State.Running}}' $global:ContainerName
    if ($containerStatus -ne "true") { # Exit the watch if the container is no longer running:
        Write-Host "Container '$global:ContainerName' not running. Stopping FileSystemWatcher."
        Unregister-Event -SourceIdentifier $eventSubscriberId
        Remove-Variable -Name watcher -Scope Global
        exit
    }
    docker exec $global:ContainerName sh -c "cd $global:CollatePath && . ./collate.sh" # run the collate script in the dev container
} | Out-Null
