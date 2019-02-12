
# Ensure that Get-ChildItemColor is loaded
Import-Module Get-ChildItemColor

# Set l and ls alias to use the new Get-ChildItemColor cmdlets
Set-Alias l Get-ChildItemColor -Option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope

# Helper function to change directory to my development workspace
# Change c:\ws to your usual workspace and everytime you type
# in git from PowerShell it will take you directly there.

function go { Set-Location c:\git\ }

# Obviously further functions can be added here to 
# allow me to shortcut to the projects I work on most often.

# Helper function to set location to the User Profile directory
function cuserprofile { Set-Location ~ }
Set-Alias ~ cuserprofile -Option AllScope

# Helper function to show Unicode character
function U
{
    param
    (
        [int] $Code
    )
 
    if ((0 -le $Code) -and ($Code -le 0xFFFF))
    {
        return [char] $Code
    }
 
    if ((0x10000 -le $Code) -and ($Code -le 0x10FFFF))
    {
        return [char]::ConvertFromUtf32($Code)
    }
 
    throw "Invalid character code $Code"
}

# open vi!
$wslBasePath = "/mnt/c"
function vi($dirAsStr) {
    $dirAsStr = split-path -NoQualifier $dirAsStr

    # My root drive is actually mounted
    # in WSL as "/mnt/c" so if my path
    # starts with "\" I need to append that
    # you can start bash and type mount
    # to find if yours is different.
    
    if ($dirAsStr.StartsWith("\")) {
        $dirAsStr = Join-Path $wslBasePath $dirAsStr
    }

    $dirAsStr = $dirAsStr -replace "\\","/"

    bash -c "vi $dirAsStr"
}

function vim($dirAsStr) {
    # Pass to vi function
    vi($dirAsStr)
}
