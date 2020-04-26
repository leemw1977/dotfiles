# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '+' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=10
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %l %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/lee/.zshrc'

autoload -Uz compinit && compinit
autoload promptinit && promptinit
prompt clint

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Add Powerline to PATH
PATH=$PATH:$HOME/.local/bin

# Get powerline folder
export POWERLINE_INSTALL_FOLDER=$(pip3 show powerline-status | grep -oP "Location: \K.*")

# Add powerline source
. $POWERLINE_INSTALL_FOLDER/powerline/bindings/zsh/powerline.zsh

# Add TheFork command!
eval $(thefuck --alias fork)

# Setup python virtual env wrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
source $HOME/.local/bin/virtualenvwrapper.sh

# Alias
alias la="ls -la"

# Add local .zshalias file
. $HOME/.zshalias
