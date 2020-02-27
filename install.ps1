Set-ExecutionPolicy Bypass -Scope:Process
Import-Module Boxstarter.Chocolatey

# Set Windows features:

Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles 
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-MicrosoftUpdate
Enable-RemoteDesktop


# Install Vagrant/VirtBox/Ubuntu
cinst virtualbox -y
cinst vagrant -y

cinst powershell-core -y
cinst microsoft-windows-terminal -y

# Everyday software
cinst microsoft-edge -y

# Editors and IDE
cinst vscode -y
cinst jetbrains-rider -y
cinst notepadplusplus -y

Install-WindowsUpdate -Full -AcceptEula