export ZSH=/home/chronos/user/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
export TERM="screen-256color"
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git tmux python ruby sudo)
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
function extract() { 
  if [ -f $1 ] ; then 
    case $1 in 
      *.tar.bz2)   tar xjf $1     ;; 
      *.tar.gz)    tar xzf $1     ;; 
      *.bz2)       bunzip2 $1     ;; 
      *.rar)       unrar e $1     ;; 
      *.gz)        gunzip $1      ;; 
      *.tar)       tar xf $1      ;; 
      *.tbz2)      tar xjf $1     ;; 
      *.tgz)       tar xzf $1     ;; 
      *.zip)       unzip $1       ;; 
      *.Z)         uncompress $1  ;; 
      *.7z)        7z x $1        ;; 
      *)     echo "'$1' cannot be extracted via extract()" ;; 
        esac 
      else 
        echo "'$1' is not a valid file" 
      fi 
}
function md5check() { 
  md5sum "$1" | grep "$2";
}
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo" 
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
export MC_SKIN=$HOME/.mc/solarized.ini
source /usr/local/share/tmux_conf/tmuxinator.zsh
