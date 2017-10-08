# Oh-My-Zsh
POWERLEVEL9k_MODE='awsome-fontconfig'
export ZSH=/home/chronos/user/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
export TERM="screen-256color"
COMPLETION_WAITING_DOTS="true"
plugins=(git tmux python ruby sudo)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs battery time)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs)
POWERLEVEL9K_IP_BACKGROUND='green'

# Vim
function vimopen() {
  if [[ $# -ne 0 ]]; then
    echo "$1 Opened in vim"
  fi
  if [[ "$1" = /* ]]; then
    if [[ -d "$1" ]];then
      echo "Lex $1" | nc -c localhost 9876
    else
      echo "e $1" | nc -c localhost 9876
    fi
  else
    if [[ $# -eq 0 ]]; then
      vim
    else
      if [[ -d "$1" ]]; then
        echo "Lex $PWD/$1" | nc -c localhost 9876
      else
        echo "e $PWD/$1" | nc -c localhost 9876
      fi
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
export VIMPYSERVER_HOME='/usr/local/share/VimPyServer'
export PATH=$VIMPYSERVER_HOME/bin:$PATH

# Midnight Commander
export MC_SKIN=$HOME/.mc/solarized.ini

# Tmuxinator
source /usr/local/share/tmux_conf/tmuxinator.zsh

# Extract
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
alias x='extract'

# MD5 Checker
function md5check() { 
  md5sum "$1" | grep "$2";
}

# Clear
alias clear='clear && echo -e && screenfetch -E && echo -e'

# zsh Final Commands
powerline-config tmux setup
clear

