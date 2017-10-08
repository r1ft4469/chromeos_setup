# Spotify
alias spotify_kill='tkss Spotify && sudo unmount-chroot -f spotify'
function spotify_start() {
    pgrep spotify.sh || sudo enter-chroot -b -n spotify spotify.sh
    tmuxinator spotify
}

# SSHD
alias sshd_kill='sudo killall sshd && sudo iptables -D INPUT -p tcp --dport 22 -j ACCEPT'
function sshd_start() {
    sudo iptables -I INPUT -p tcp --dport 22 -j ACCEPT
    sudo unmount-chroot -f -k spotify
    sudo /usr/sbin/sshd
    tmux detach
}

# Power Management
function power_suspend_disable() {
    sudo su -c 'echo 1 > /var/lib/powermanager/disable_idle_suspend'
    sudo su -c 'chown power:power /var/lib/power_manager/disable_idle_suspend'
    sudo su -c 'restart powerd'
}
function power_suspend_enable() {
    sudo su -c 'rm /var/lib/power_manager/disable_idle_suspend'
    sudo su -c 'restart powerd'
}
