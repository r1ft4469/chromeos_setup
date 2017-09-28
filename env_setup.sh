#!/bin/bash
wget https://goo.gl/fd3zc
wget -q -O - https://raw.github.com/skycocker/chromebrew/master/install.sh | bash
crew install powerline_fonts
crew install tmux
crew install vim
crew install htop
crew install iftop
crew install screenfetch
crew install python27
crew install zsh
pip install powerline-status
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir /usr/local/share/tmux_conf
ln -s /usr/local/share/tmux_conf ~/.tmux
gem install tmuxinator
mv crouton /usr/local/bin/
chmod +x /usr/local/bin/crouton
git clone https://github.com/r1ft4469/chromeos_setup ~/
