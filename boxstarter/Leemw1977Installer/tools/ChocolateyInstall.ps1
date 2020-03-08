try {
  # Set-ExecutionPolicy Bypass -Scope:Process
  # Import-Module Boxstarter.Chocolatey
  # Chocolatey pacakges:
  # Install Vagrant/VirtBox/Ubuntu
  cinst virtualbox -y
  cinst vagrant -y

  # CLI's
  cinst powershell-core -y
  cinst microsoft-windows-terminal -y

  # Everyday software
  cinst microsoft-edge -y
  cinst 7zip

  # Editors and IDE
  cinst vscode -y
  cinst jetbrains-rider -y
  cinst notepadplusplus -y


  # Source control
  cinst poshgit -y
  cinst git -y
  #TODO put this in - it's a bit flaky though if this is already installed it bombs boxstarter for some reason
  #cinst gitkraken - y

#TODO Files aren't being included / found when we get to this stage

  # Copy setup of dotfiles to "temp folder"
  $installFolder = 'leemw1977-dot-files'
  $fullInstallPath = Join-Path -Path $env:LOCALAPPDATA -ChildPath $installFolder
  $pathExists = Test-Path -Path $fullInstallPath

  if ($pathExists -eq $False) {
      New-Item -Path $fullInstallPath -ItemType Directory
  } else {
    Remove-Item -Recurse $fullInstallPath
    New-Item -Path $fullInstallPath -ItemType Directory
  }
  Write-Host "Copying from $(Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath 'install.sh')"
  Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath 'install.sh') -Force (Join-Path -Path $fullInstallPath  -ChildPath 'install.sh')
  Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath '.tmux.conf') -Force (Join-Path -Path $fullInstallPath  -ChildPath '.tmux.conf')
  Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath '.vimrc') -Force (Join-Path -Path $fullInstallPath  -ChildPath '.vimrc')
  Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath '.zshrc') -Force (Join-Path -Path $fullInstallPath  -ChildPath '.zshrc')
  Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath '*.sh') -Force (Join-Path -Path $fullInstallPath  -ChildPath '*.sh')
  Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath '*.ttf') -Force (Join-Path -Path $fullInstallPath  -ChildPath '*.ttf')

  Install-WindowsUpdate -Full -AcceptEula


  # Set Windows features:
  Write-BoxstarterMessage "Setting windows options"
  Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles 
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
  Enable-MicrosoftUpdate
  Enable-RemoteDesktop

  Write-BoxstarterMessage "Installing WSL"
  Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing
  Add-AppxPackage .\Ubuntu.appx


  Write-ChocolateySuccess 'Leemw1977Installer'
}
catch {
  Write-ChocolateyFailure 'Leemw1977Installer' $($_.Exception.Message)
  throw
}