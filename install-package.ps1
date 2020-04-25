Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-BoxstarterBuild Leemw1977Installer

$cred=Get-Credential aUser
Install-BoxstarterPackage -PackageName "Leemw1977Installer" -Credential $cred