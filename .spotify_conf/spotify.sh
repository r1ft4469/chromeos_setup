#!/bin/bash
mkfifo /tmp/mpd.fifo
mopidy &>/dev/null &
while :; do yes $'\n' | nc -l -u localhost 5555 ; done > /tmp/mpd.fifo 
