#!/bin/bash
sudo unmount-chroot -f -k spotify
sudo /usr/sbin/sshd
echo -n "Running SSH Server Press CTRL+C to exit"
read
sudo killall sshd
