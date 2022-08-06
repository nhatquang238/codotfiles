#!/bin/bash

echo -n 'Setting up for Mac...'
echo -n 'Installing Brew...'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo -n 'Installing common libs...'
brew update
brew install gnutls texinfo the_silver_searcher tmux zsh jq tig trash-cli nginx postgresql@13 pyenv
echo 'export PATH="/opt/homebrew/opt/texinfo/bin:$PATH"' >> ~/.zshrc

echo -n 'Setting up pyenv...'
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

echo -n 'Installing emacs 28.1 ...'
curl https://ftp.gnu.org/gnu/emacs/emacs-28.1.tar.xz --output emacs-28.1.tar.xz
tar -xf emacs-28.1.tar.xz
cd emacs-28.1
./autogen.sh
./configure
make bootstrap -j4
make install
mv nextstep/Emacs.app /Applications
echo 'alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"' >> ~/.zshrc

cd ~

echo -n 'Installing gcloud...'
hardwareChip="$(uname -m)"
case "${hardwareChip}" in
    x86_64*) curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-396.0.0-darwin-x86_64.tar.gz --output gcloud-cli.tar.gz;;
    arm64*) curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-396.0.0-darwin-arm.tar.gz --output gcloud-cli.tar.gz;;
    *) curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-396.0.0-darwin-x86.tar.gz gcloud-cli.tar.gz
esac
tar -xf gcloud-cli.tar.gz
./google-cloud-sdk/install.sh --quiet

echo -n 'Installing kubectl...'
gcloud components install kubectl

echo -n 'Setting up keybindings...'
mkdir -p ~/Library/KeyBindings
cp ~/codotfiles/DefaultKeyBinding.Dict ~/Library/KeyBindings/DefaultKeyBinding.Dict
