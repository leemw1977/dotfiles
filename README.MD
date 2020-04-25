# Using Choco Installer and box starter

For a Windows machine:

## Step 1 - Install choco:

Run the following command in an elevated powershell

`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`

## Step 2 - Install BoxStarter
In the elevated powershell window run this install:

`choco install boxstarter -y`

Then restart your elevated powershell

## Step 3 - Install boxstarter package:
Now you can clone the repo and then in an elevated powershell prompt in the root of the directory you cloned to execute:

```
.\install-package.ps1 
```

It will ask you for your user credentials to ensure it can restart with resilience and continue the install routine.

## Step 3 - Install the Hack and Cascadia fonts
Look in the directories on this repo for the ttf files - there may be updates to these fonts so you can always get the latest version from the [Cascadia Code GitHub Repo](https://github.com/microsoft/cascadia-code/releases) and for the `Hack` font which can be found in the [Powerline GitHub Repo](https://github.com/powerline/fonts/tree/master/Hack)


## Step 4 - Optional installs:
* The [WhackWhackTerminal](https://marketplace.visualstudio.com/items?itemName=dos-cafe.WhackWhackTerminal) for visual studio integrated terminal goodness.
* Visual Studio Current Version Enterprise Preview, once visual studio is installed then maybe:
    ```
     # Visual Studio packages
    cinst addnewfile # Mads Kris. Web Essentials
    cinst markdowneditor
    ```