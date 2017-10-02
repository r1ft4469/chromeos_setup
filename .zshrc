export ZSH=/home/chronos/user/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
export TERM="screen-256color"
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
function vimopen() {
  if [[ $# -ne 0 ]]; then
    echo "$1 Opened in vim"
  fi
  if [[ "$1" = /* ]]; then
    echo "e $1" | nc -c localhost 9876
  else
    if [[ $# -eq 0 ]]; then
      vim
    else
      echo "e $PWD/$1" | nc -c localhost 9876
    fi
  fi
}
export -f vimopen
alias vim=vimopen
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='vim'
fi
alias clear='clear && echo -e && screenfetch -E && echo -e'
clear
export VIMPYSERVER_HOME='/usr/local/share/VimPyServer'
export PATH=$VIMPYSERVER_HOME/bin:$PATH
source /usr/local/share/tmux_conf/tmuxinator.zsh
