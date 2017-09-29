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
passattemts=0
trap "" SIGINT
while true; do
  echo -e 'Enter Password ... \c'
  read -s pass
  echo $pass | sudo -lS &> /dev/null
  status=$?
  if test $status -eq 0
  then
    trap - SIGINT
    break
  else
    ((passattemts++))
    echo 'Wrong Password'
  fi
  if (( $passattemts > 2 )); then
    echo '3 Wrong login attemts'
    exit
  fi
done
tmuxinator base pass=$pass
unset pass
exit
