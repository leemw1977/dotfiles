. baseProfile.ps1

# Ensure posh-git is loaded
Import-Module -Name posh-git

# Start SshAgent if not already
#setx GIT_SSH "C:\Windows\System32\OpenSSH\ssh.exe"
# Need this if you are using github as your remote git repository
#if (! (ps | ? { $_.Name -eq 'ssh-agent'})) {
#    #Start-SshAgent
#    C:\Windows\System32\OpenSSH\ssh-agent.exe
#}

# Ensure oh-my-posh is loaded
Import-Module -Name oh-my-posh

# Default the prompt to agnoster oh-my-posh theme
#Set-Theme agnoster
Set-Theme alteredbeast