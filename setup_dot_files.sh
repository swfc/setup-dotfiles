#!/bin/bash
set -e

DIR=$HOME
cd $DIR

# check if zsh is installed
if command -v zsh >/dev/null 2>&1; then
    echo "zsh is already installed"
else
    echo "zsh is not installed, installing now..."
    sudo apt update -y
    sudo apt install -y zsh
fi

# set ZSH
ZSH=$DIR/.oh-my-zsh

# install oh-my-zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
chmod +x install.sh
./install.sh --skip-chsh --unattended

# modify ls aliases
sed -i -e "s/ll='ls -l'/ll='ls -laFh'/" $DIR/.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh

# append micromamba aliases
cat <<EOT >> $DIR/.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh

# micromamba aliases
alias mm='micromamba'
alias mma='micromamba activate'
alias mmd='micromamba deactivate'
EOT

# install custom plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$DIR/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$DIR/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install powerlevel10k custom theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$DIR/.oh-my-zsh/custom}/themes/powerlevel10k

# initialize and clone dotfile into home dir
git init
git remote add origin git@github.com:swfc/dotfiles.git
git fetch
git checkout -f master
