# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
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
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias rake='noglob rake'
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias clr='clear'
alias ack='ack-grep'

# 99 alias
alias viren='. venv/bin/activate'
alias 99web='viren; python 99.py'
alias 99search='viren; python web.py --port=6000 --process=0'
alias gw='gulp watch'
alias gwm='gulp watchMinify'
alias g='gulp'
alias 99search3='viren; python web.py'


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# enable autocorrectselect 
setopt correct

# set LANG env variables
export LANG=en_US.UTF-8

export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin

# apparix
# {{{
# this is take from the apparix shell-examples for bash so well
# need bash complete
autoload bashcompinit
bashcompinit
# from apparix shell-examples
to () {
if test "$2"; then
cd "$(apparix "$1" "$2" || echo .)";
else
cd "$(apparix "$1" || echo .)";
fi
pwd
}
bm () {
if test "$2"; then
apparix --add-mark "$1" "$2";
elif test "$1"; then
apparix --add-mark "$1";
else
apparix --add-mark;
fi
}
portal () {
if test "$1"; then
apparix --add-portal "$1";
else
apparix --add-portal;
fi
}
# function to generate list of completions from .apparixrc
_apparix_aliases ()
{   cur=$2
dir=$3
COMPREPLY=()
if [ "$1" == "$3" ]
then
COMPREPLY=( $( cat $HOME/.apparix{rc,expand} | \
grep "j,.*$cur.*," | cut -f2 -d, ) )
else
dir=`apparix -favour rOl $dir 2>/dev/null` || return 0
eval_compreply="COMPREPLY=( $(
cd "$dir"
\ls -d *$cur* | while read r
do
[[ -d "$r" ]] &&
[[ $r == *$cur* ]] &&
echo \"${r// /\\ }\"
done
) )"
eval $eval_compreply
fi
return 1
}
# zstyle :completion:*:to:* completer _apparix_aliases
# command to register the above to expand when the tos commands args are
# being expanded
complete -F _apparix_aliases to
# }}}

clr
