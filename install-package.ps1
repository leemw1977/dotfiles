Set-ExecutionPolicy Bypass -Scope Process -Force
$cred=Get-Credential aUser
Install-BoxstarterPackage -PackageName "Leemw1977Installer" -Credential $cred