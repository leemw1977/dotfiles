# My personal dot files
Here are my zshrc and ps profile

I use posh-git & oh-my-posh

~I'm still currenty having issues with SSH on a few of my accessing devices - I hope to solve this problem in the coming weeks.~ This was - as suspected - me being a bit daft.  I'd create the keys under ssh - which was running on windows - and then trying to use them in WSL - a different ssh exe so it was confusing the hell out it.

* `.zshrc` is my zsh profile - it's been a journey through some great projects
* `.powerline-template` is a `.zshrc` profile - standing on the shoulders of the great 
powerline9k
* `.oh-my-zsh-template` is a `.zshrc` profile - standing on the shoulders of the great oh-my-zsh - I like to use this from time to time if I don't or can't use powerline
* `.tmux.conf` I use powerline with tmux now, it was a bit of an eye opener for me
* `.vimrc` my vim configuration is a little basic for some possibly, but I still have my L plates on with regard to Vim/Vi.
* `alteredbeast.psm1` is a theme for oh-my-posh based on the brilliant agnoster theme - I've added the date/time here
* `Microsoft.PowerShell_profile.ps1` is my PS profile, contents of which is symlinked to where `$PROFILE` points or `$PROFILE` is amended to point at this file.

### I should install the latest vim
```shell
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```
Should I need to downgrade this should do the trick:
`sudo apt install ppa-purge && sudo ppa-purge ppa:jonathonf/vim`

### Broken down installation
`pip install powerline-status`
make sure `powerline-config`/`powerline` are available (i.e. the path they are installed is in your `$PATH`)

pip install powerline-gitstatus




### Basic Installation

Oh My Zsh is installed by running one of the following commands in your terminal. You can install this via the command-line with either `curl` or `wget`.

#### via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/leemw1977/dotfiles/master/install.sh)"
```

#### via wget

```shell
sh -c "$(wget https://raw.githubusercontent.com/leemw1977/dotfiles/master/install.sh -O -)"
```
