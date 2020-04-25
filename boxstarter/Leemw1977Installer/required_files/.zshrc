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

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lee/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz promptinit && promptinit
prompt clint

# Add Powerline to PATH
PATH=$PATH:$HOME/.local/bin

# Add powerline source
. $HOME/.local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh