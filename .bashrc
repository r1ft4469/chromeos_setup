# Check for Interactive Shell
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# IP Address VAR
export ip_addr=$(ip addr show | grep '\<inet\>' | tr -s ' ' | cut -d ' ' -f3 | sed /127.0.0.1/d | sed 's/...$//' | sed 'H;1h;$!d;x;y/\n/,/')

# VARS
export EDITOR='vim'
export TERM=screen-256color

# Powerline Setup
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
export POWERLINE_CONFIG_COMMAND=/usr/local/bin/

# SSH Agent
env=~/.ssh/agent.env
agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
agent_start () {
  (umask 077; ssh-agent >| "$env")
  . "$env" >| /dev/null ; }
agent_load_env
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
  agent_start
  ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
  ssh-add
fi
unset env

# Start Tmux
tmuxinator base
exit
