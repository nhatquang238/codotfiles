#!/bin/bash

echo -n "starting setup process..."
echo -n "copying dotfiles..."

cd ~
# update
sudo apt-get update

# install dependencies
sudo apt-get install build-essential make curl emacs24 silversearcher-ag apparix tmux zsh

# install oh-my-zsh
sh -c "$(curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

chsh -s /bin/zsh

# initiate emacs config
git clone git@github.com:nhatquang238/my-sane-emacs.d.git

mv my-sane-emacs.d/ .emacs.d/
mkdir emacs-packages && cd emacs-packages
git clone git@github.com:akfish/ac-coffee.git

cd ~
cd codotfiles

for dotfile in `ls .*`; do
    cp $dotfile ~/$dotfile
done

cd ~

# restarting config file
echo -n "brace yourself son! Here come the awesome!"
exec zsh
. ~/.zshrc
