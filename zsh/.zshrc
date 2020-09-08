export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bira"

plugins=(
    git-hubflow
    pip
    docker
    vagrant
)

source $ZSH/oh-my-zsh.sh
source $HOME/.env

export PATH="$PATH:$HOME/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -d $HOME/.pyenv ]; then
    export PATH="$PATH:$HOME/.pyenv/bin"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

if [ -d $HOME/.cargo ]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

export TERMINAL=${TERMINAL:=/usr/local/bin/st}
