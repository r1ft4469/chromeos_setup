#!/bin/bash
wget https://raw.github.com/dnschneid/crouton/master/installer/crouton
pip install powerline-status
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir /usr/local/share/tmux_conf
ln -s /usr/local/share/tmux_conf ~/.tmux
gem install tmuxinator
mv crouton /usr/local/bin/
chmod +x /usr/local/bin/crouton
git clone https://github.com/r1ft4469/chromeos_setup
cd chromeos_setup
mv ./. ~/
