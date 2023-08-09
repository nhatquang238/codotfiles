#!/bin/bash

echo -n 'Installing zsh'
sudo apt install zsh

echo -n 'Installing oh-my-zsh...'
sh -c "$(curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -n 'Installing zsh plugins...'
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

echo -n 'Setting up zsh theme.'
cp $HOME/codotfiles/honukai.zsh-theme ~/.oh-my-zsh/themes
