# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="honukai"

# Example aliases
# alias zshconfig="mate~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_DIR="$HOME/.nvm"

plugins=(git jsontools history httpie zsh-z zsh-nvm)

source $ZSH/oh-my-zsh.sh
source ~/codotfiles/machine-check.sh

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH

alias clr='clear'
alias TERM="xterm-16color emacs"
alias rm="echo do not use rm!! use trash-cli instead so you can recover files if you need.; false"

# tmus alias
alias tma='tmux attach -t'
alias tmn='tmux new -s'
alias tml='tmux ls'
alias tms='tmux switch -t'
alias tmk='tmux kill-session -t'

# 99 alias
alias viren='. venv/bin/activate'
alias viren3='. venv3/bin/activate'

PATH=$PATH:$HOME/.google-cloud-sdk/bin

# enable autocorrectselect 
setopt correct

# set LANG env variables
export LANG=en_US.UTF-8

# Enable ssh-agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
fi

# Fix ForwardAgent for Tmux
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;
export PYTHONSTARTUP=~/.pyrc;

if [ "$MACHINE" = "Linux" ]; then eval `dircolors $HOME/.dir_colors`; fi

# Check if 'kubectl' is a command in $PATH
if [ $commands[kubectl] ]; then

  # Placeholder 'kubectl' shell function:
  # Will only be executed on the first call to 'kubectl'
  kubectl() {

    # Remove this function, subsequent calls will execute 'kubectl' directly
    unfunction "$0"

    # Load auto-completion
    source <(kubectl completion zsh)

    # Execute 'kubectl' binary
    $0 "$@"
  }
fi

# autocomplete gcloud stuff
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then source $HOME/google-cloud-sdk/path.zsh.inc; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then source $HOME/google-cloud-sdk/completion.zsh.inc; fi

# make brew work on m1
if [ $(uname -m) = 'arm64' ]; then eval $(/opt/homebrew/bin/brew shellenv); fi

# pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# share history
setopt share_history
