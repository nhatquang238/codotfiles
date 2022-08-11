#!/bin/bash

echo -n 'Setting up for Ubuntu...'
sudo apt-get update

echo -n 'Installing common libs...'
sudo apt-get -y install build-essential make curl emacs28 silversearcher-ag tmux zsh trash-cli nginx postgresql-13 apt-transport-https ca-certificates gnupg

echo -n 'Installing gcloud...'
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get -y install google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin

echo -n 'Installing kubectl...'
gcloud components install kubectl

echo 'export EDITOR="emacs"' >> ~/.zshrc
