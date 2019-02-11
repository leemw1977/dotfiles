# Setup Path for environment to include powerline bin
export PATH="$HOME/.local/bin:$PATH"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
unsetopt autocd beep nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz promptinit
promptinit
prompt walters

# Aliases
alias go="cd /mnt/c/git"
alias hp="cd /mnt/c/git/tcb.hubportal"
alias hs="cd /mnt/c/git/tcb.hubservice"
alias tmux="tmux -2"


# some more ls aliases
alias ll='ls -alF'
alias lsa="ls -la"
alias la='ls -A'
alias l='ls -CF'



# n for node version management
#export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# TMUX
if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux 

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

# Setup web proxy if required uncomment these lines and replace the URL's
# URL's can be  {protocol}://user:password@proxyIP:proxyPort/ if required.
export http_proxy=http://localhost:8877/
export https_proxy=https://localhost:8877/
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
# export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

# Setup Powerline for zsh - if it's really required?
# PowerLevel9k
#source  ~/powerlevel9k/powerlevel9k.zsh-theme
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs newline)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history date time)
#POWERLEVEL9K_DATE_FORMAT=%D{%d/%m/%Y}
powerline-daemon --quiet
. ~/.local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
