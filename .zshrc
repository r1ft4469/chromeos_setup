export ZSH=/home/chronos/user/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
export TERM="screen-256color"
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='vim'
fi

source /usr/local/share/tmux_conf/tmuxinator.zsh
