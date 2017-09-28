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
echo -e 'Enter Password ...\c'
read -s pass
tmuxinator base pass=$pass
unset pass
