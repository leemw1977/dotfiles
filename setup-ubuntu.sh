#!/bin/bash 
add_ppa() {
  for i in "$@"; do
    grep -h "^deb.*$i" /etc/apt/sources.list.d/* > /dev/null 2>&1
    if [ $? -ne 0 ]
    then
      echo "Adding ppa:$i"
      sudo add-apt-repository -y ppa:$i
    else
      echo "ppa:$i already exists"
    fi
  done
}


add_ppa jonathonf/vim
add_ppa git-core/ppa

#sudo echo "deb https://apt.enpass.io/ stable main" > /etc/apt/sources.list.d/enpass.list
#sudo wget -O - https://apt.enpass.io/keys/enpass-linux.key | apt-key add -

sudo apt update 
sudo apt install vim git python3 python3-pip python3-venv hub zsh enpass tmux -y

pip3 install thefuck virtualenvwrapper powerline-status powerline-gitstatus

wget -O $HOME/.zshrc https://raw.githubusercontent.com/leemw1977/dotfiles/master/boxstarter/Leemw1977Installer/required_files/.zshrc
wget -O $HOME/.tmux.conf https://raw.githubusercontent.com/leemw1977/dotfiles/master/boxstarter/Leemw1977Installer/required_files/.tmux.conf
wget -O $HOME/.vimrc https://raw.githubusercontent.com/leemw1977/dotfiles/master/boxstarter/Leemw1977Installer/required_files/.vimrc

if [[ -f $HOME/.zshalias ]]
then
        echo "$HOME/.zshalias exists on your filesystem and so will not be over-written."
else
    echo "Initialiasing user alias file at $HOME/.zshalias."
    touch $HOME/.zshalias
fi
