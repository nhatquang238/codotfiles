#!/bin/bash

echo -n "starting setup process..."

cd ~
source $HOME/codotfiles/zsh-setup.sh
source $HOME/codotfiles/machine-check.sh

if [ "${MACHINE}" == "Linux" ]; then
    source $HOME/codotfiles/ubuntu-setup.sh
elif [ "${MACHINE}" == "Mac" ]; then
    source $HOME/codotfiles/mac-setup.sh
fi

source $HOME/codotfiles/setup-emacs.sh

cd $HOME/codotfiles
echo -n "copying dotfiles..."
for dotfile in `ls .*`; do
    cp $dotfile ~/$dotfile
done

cd ~
echo -n "brace yourself son! Here come the awesome!"

exec zsh
. ~/.zshrc
