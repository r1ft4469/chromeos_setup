if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi
export EDITOR='vim'
export TERM=screen-256color
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
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
pgrep spotify.sh || sudo enter-chroot -b -n spotify spoitify.sh
tmuxinator base
exit
