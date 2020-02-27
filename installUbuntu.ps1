# Install Ubuntu
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing
Add-AppxPackage .\Ubuntu.appx

# Install Fedora Remix?
# Invoke-WebRequest -Uri https://github.com/WhitewaterFoundry/Fedora-Remix-for-WSL/releases/download/1.31.15/Fedora-Remix-for-WSL_1.31.15.0_x64_arm64.appxbundle -OutFile FedoraRemix.appx -UseBasicParsing
# Add-AppxPackage .\FedoraRemix.appx

# Add ubuntu to path environment variable allowing us to start it from anywhere
# on the command line.

# TODO Might need this, but now we're installing via Add-AppxPackage we may not
# $userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
# [System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";C:\Users\Administrator\Ubuntu", "User")