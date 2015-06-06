#!/bin/bash

echo -n "starting setup process..."
echo -n "copying dotfiles..."

for dotfile in `ls .*`; do
    cp $dotfile ~/$dotfile
done

cd ~
# update
sudo apt-get update

# install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# install dependencies
sudo apt-get install emacs24 silversearcher-ag apparix tmux git

# initiate emacs config
git clone git@github.com:nhatquang238/my-sane-emacs.d.git

mv my-sane-emacs.d/ .emacs.d/
mkdir emacs-packages | cd emacs-packages
git clone git@github.com:akfish/ac-coffee.git

cd ~

# restarting config file
echo -n "brace yourself son! Here come the awesome!"
. ~/.zshrc
