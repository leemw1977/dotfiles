try {
    # Set-ExecutionPolicy Bypass -Scope:Process
    # Import-Module Boxstarter.Chocolatey
    # Chocolatey pacakges:


    # Up first do the windows updates
    Install-WindowsUpdate -Full -AcceptEula


    # CLI's
    cinst powershell-core -y

    # Everyday software
    cinst 7zip -y

    # Editors and IDE
    cinst vscode -y
    cinst jetbrains-rider -y
    cinst notepadplusplus -y
    
    # Source control
    cinst hub -y
    cinst poshgit -y
    cinst git -y

    # Broadcasting
    cinst obs-studio -y

    # Copy setup of dotfiles to a local folder
    $installFolder = 'leemw1977-dot-files'
    $fullInstallPath = Join-Path -Path $env:LOCALAPPDATA -ChildPath $installFolder
    $pathExists = Test-Path -Path $fullInstallPath
    $sourcePath = Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath 'required_files'
    if ($pathExists -eq $False) {
        New-Item -Path $fullInstallPath -ItemType Directory

        Write-Host "Copying from $sourcePath"
        Copy-Item (Join-Path -Path ($sourcePath) -ChildPath '.tmux.conf') -Force (Join-Path -Path $fullInstallPath  -ChildPath '.tmux.conf')
        Copy-Item (Join-Path -Path ($sourcePath) -ChildPath '.vimrc') -Force (Join-Path -Path $fullInstallPath  -ChildPath '.vimrc')
        Copy-Item (Join-Path -Path ($sourcePath) -ChildPath '.zshrc') -Force (Join-PatH -Path $fullInstallPath  -ChildPath '.zshrc')
        Copy-Item (Join-Path -Path ($sourcePath) -ChildPath 'powershell_profile.ps1') -Force (Join-Path -Path $fullInstallPath  -ChildPath 'powershell_profile.ps1')
        Copy-Item (Join-Path -Path ($sourcePath) -ChildPath 'Cascadia.ttf') -Force (Join-Path -Path $fullInstallPath  -ChildPath 'Cascadia.ttf')
        Copy-Item (Join-Path -Path ($sourcePath) -ChildPath 'CascadiaPL.ttf') -Force (Join-Path -Path $fullInstallPath  -ChildPath 'CascadiaPL.ttf')
        Copy-Item (Join-Path -Path ($sourcePath) -ChildPath 'Hack-Bold.ttf') -Force (Join-Path -Path $fullInstallPath  -ChildPath 'Hack-Bold.ttf')
        Copy-Item (Join-Path -Path ($sourcePath) -ChildPath 'Hack-BoldItalic.ttf') -Force (Join-Path -Path $fullInstallPath  -ChildPath 'Hack-BoldItalic.ttf')
        Copy-Item (Join-Path -Path ($sourcePath) -ChildPath 'Hack-Regular.ttf') -Force (Join-Path -Path $fullInstallPath  -ChildPath 'Hack-Regular.ttf')
    } else {
      Write-BoxstarterMessage("dot files already exist, remove the directory $fullInstallPath if you want to reinstall from the package.")
    }

    # Troublesome packages go here - these are ones that have caused issues in the past
    cinst visualstudio2019community -y
    cinst microsoft-windows-terminal -y

    # Finally Set Windows features:
    Write-BoxstarterMessage "Setting windows options"
    Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles 
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    Enable-MicrosoftUpdate
    Enable-RemoteDesktop

    
    Write-BoxstarterMessage 'Leemw1977Installer installed successfully'
} catch {
  Write-BoxstarterMessage 'Leemw1977Installer not installed successfully' $($_.Exception.Message)
  throw
}