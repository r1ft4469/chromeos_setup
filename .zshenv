# Spotify
alias spotify_kill='tkss Spotify && sudo unmount-chroot -f spotify'
function spotify_start() {
    pgrep spotify.sh || sudo enter-chroot -b -n spotify spotify.sh
    tmuxinator spotify
}

# SSHD
alias sshd_kill='sudo killall sshd'
function sshd_start() {
    sudo unmount-chroot -f -k spotify
    sudo /usr/sbin/sshd
    tmux detach
}
