main() {
  # Use colors, but only if connected to a terminal, and that terminal
  # supports them.
  if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
  fi

  # Only enable exit-on-error after the non-critical colorization stuff,
  # which may fail on systems lacking tput or terminfo
  set -e

  if ! command -v zsh >/dev/null 2>&1; then
    printf "${YELLOW}Zsh is not installed!${NORMAL} Please install zsh first!\n"
    exit
  fi

  if [ ! -n "$INSTALLDIR" ]; then
    INSTALLDIR=~/.leemw-1977-dotfiles
  fi

  if [ -d "$INSTALLDIR" ]; then
    printf "${YELLOW}You already have the dotfiles installed.${NORMAL}\n"
    printf "You'll need to remove $INSTALLDIR if you want to re-install.\n"
    exit
  fi

  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  printf "${BLUE}Cloning leemw1977's dot files...${NORMAL}\n"
  command -v git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
  }
  # The Windows (MSYS) Git is not compatible with normal use on cygwin
  if [ "$OSTYPE" = cygwin ]; then
    if git --version | grep msysgit > /dev/null; then
      echo "Error: Windows/MSYS Git is not supported on Cygwin"
      echo "Error: Make sure the Cygwin git package is installed and is first on the path"
      exit 1
    fi
  fi
  env git clone --depth=1 https://github.com/leemw1977/dotfiles.git "$INSTALLDIR" || {
    printf "Error: git clone of leemw-dot-files repo failed\n"
    exit 1
  }


  printf "${BLUE}Looking for an existing zsh config...${NORMAL}\n"
  if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    printf "${YELLOW}Found ~/.zshrc.${NORMAL} ${GREEN}Backing up to ~/.zshrc.pre-leemw-dot-files${NORMAL}\n";
    mv ~/.zshrc ~/.zshrc.pre-leemw-dot-files;
 

  fi

 
  printf "${BLUE}Looking for an existing tmux config...${NORMAL}\n"
  if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]; then
    printf "${YELLOW}Found ~/.tmux.conf.${NORMAL} ${GREEN}Backing up to ~/.tmux.conf.pre-leemw-dot-files${NORMAL}\n";
    mv ~/.tmux.conf ~/.tmux.conf.pre-leemw-dot-files;
  fi

  printf "${BLUE}Looking for an existing vimrc config...${NORMAL}\n"
  if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    printf "${YELLOW}Found ~/.vimrc.${NORMAL} ${GREEN}Backing up to ~/.vimrc.pre-leemw-dot-files${NORMAL}\n";
    mv ~/.vimrc ~/.vimrc.pre-leemw-dot-files;
  fi
  
  printf "${BLUE}Using the leemw1977's dot files: creating relevant files from templates${NORMAL}\n"
  cp "$INSTALLDIR"/templates/zshrc.template ~/.zshrc
  # If we're on WSL reset the SHELL variable as it will always be bash
  if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    # Reset shell
    printf "${YELLOW}Found we are running on WSL/Microsoft.${NORMAL} ${GREEN}Adding a line that will setup the shell variable to point to zsh as it should be after install.${NORMAL}\n"
    sed 's/# SHELL=\/dev\/null/\SHELL=\/bin\/zsh/' ~/.zshrc > ~/.zshrc-ldftemp
    mv -f ~/.zshrc-omztemp ~/.zshrc
  fi

  cp "$INSTALLDIR"/templates/tmux.conf.template ~/.tmux.conf
  cp "$INSTALLDIR"/templates/vimrc.template ~/.vimrc

  

  # If this user's login shell is not already "zsh", attempt to switch.
  TEST_CURRENT_SHELL=$(basename "$SHELL")
  if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    # If this platform provides a "chsh" command (not Cygwin), do it, man!
    if hash chsh >/dev/null 2>&1; then
      printf "${BLUE}Time to change your default shell to zsh!${NORMAL}\n"
      chsh -s $(grep /zsh$ /etc/shells | tail -1)
    # Else, suggest the user do so manually.
    else
      printf "I can't change your shell automatically because this system does not have chsh.\n"
      printf "${BLUE}Please manually change your default shell to zsh!${NORMAL}\n"
    fi
  fi

  printf "${GREEN}"

  echo ''
  echo '    __                           _______  ___________              __      __     _____ __          '
  echo '   / /__  ___  ____ ___ _      _<  / __ \/__  /__  ( )_____   ____/ /___  / /_   / __(_) /__  _____ '
  echo '  / / _ \/ _ \/ __ `__ \ | /| / / / /_/ /  / /  / /|// ___/  / __  / __ \/ __/  / /_/ / / _ \/ ___/ '
  echo ' / /  __/  __/ / / / / / |/ |/ / /\__, /  / /  / /  (__  )  / /_/ / /_/ / /_   / __/ / /  __(__  )  '
  echo '/_/\___/\___/_/ /_/ /_/|__/|__/_//____/  /_/  /_/  /____/   \__,_/\____/\__/  /_/ /_/_/\___/____/   '
  echo ''
  echo 'Please look over the ~/.zshrc, ~/.tmux.conf, and ~/.vimrc files.'
  echo 'Any existing files are backed up in your home drive. Tagged with .pre-leemw-dot-files'
  echo ''
  echo ''
  printf "${NORMAL}"
  env zsh -l
}

main
