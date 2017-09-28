#!/bin/bash
wget https://raw.github.com/dnschneid/crouton/master/installer/crouton
wget -q -O - https://raw.github.com/skycocker/chromebrew/master/install.sh | bash
Y | crew install powerline_fonts
Y | crew install tmux
Y | crew install vim
Y | crew install htop
Y | crew install iftop
Y | crew install screenfetch
Y | crew install python27
Y | crew install zsh
pip install powerline-status
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir /usr/local/share/tmux_conf
ln -s /usr/local/share/tmux_conf ~/.tmux
gem install tmuxinator
mv crouton /usr/local/bin/
chmod +x /usr/local/bin/crouton
git clone https://github.com/r1ft4469/chromeos_setup ~/
