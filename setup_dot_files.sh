#!/bin/bash

cd $HOME

# check if zsh is installed
if command -v zsh >/dev/null 2>&1; then
    echo "zsh is already installed"
else
    echo "zsh is not installed, installing now..."
    sudo apt update -y
    sudo apt install -y zsh
fi

# install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install custom plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install powerlevel10k custom theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# initialize and clone dotfile into home dir
git init
git remote add origin git@github.com:swfc/dotfiles.git
git fetch
git checkout -f master
