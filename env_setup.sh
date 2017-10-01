#!/bin/bash

# Install Crouton
cd /tmp
wget https://raw.github.com/dnschneid/crouton/master/installer/crouton
mv crouton /usr/local/bin/
chmod +x /usr/local/bin/crouton

# Install Powerline
pip install powerline-status

# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Install Tmuxinator
mkdir /usr/local/share/tmux_conf
ln -s /usr/local/share/tmux_conf ~/.tmux
cd ~/.tmux
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh
gem install tmuxinator

# Install Vim Plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git
git clone git://github.com/airblade/vim-gitgutter.git
git clone git://github.com/ervandew/supertab
git clone git://github.com/SirVer/ultisnips
git clone https://github.com/honza/vim-snippets.git

# Install Settings
cd /tmp
git clone https://github.com/r1ft4469/chromeos_setup
cp -rf chromeos_setup/. ~/
rm -rf chromeos_setup
cd ~
git remote set-url origin git@github.com:r1ft4469/chromeos_setup.git
echo 'Github Email: /c'
read gitemail
echo -e
echo 'Github User: /c'
read gituser
echo -e
git config --global user.name '$gituser'
git config --global user.email '$gitemail'
ssh-keygen -t rsa -b 4096 -C $gitemail
curl -u $gituser \
    --data "{\"title\":\"ChromeOS`\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" \
    https://api.github.com/user/keys
unset gituser
unset gitemail
mkdir -p /tmp/test
sudo mount --bind /home/chronos /tmp/test/
cd /tmp/test/user
cp ~/.fonts.con .

# Setup Spotify chroot
sudo crouton -t cli-extra,audio, -n spotify
mkdir /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.config/mopidy
mkdir /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.ncmpcpp
cp ./.spotify_conf/playlist /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.ncmpcpp/
cp ./.spotify_conf/browser /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.ncmpcpp/
cp ./.spotify_conf/vis /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.ncmpcpp/
cp ./.spotify_conf/mopidy.conf /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.config/mopidy/
sudo cp ./.spotify_conf/spotify.sh /mnt/stateful_partition/crouton/chroots/spotify/bin/
sudo cp ./.spotify_conf/setup.sh /mnt/stateful_partition/crouton/chroot/spotify/bin/
sudo cp ./.spotify_conf/rc.local /mnt/stateful_partition/crouton/chroots/spotify/etc/
sudo chmod +x /mnt/stateful_partition/crouton/chroots/spotify/bin/spotify.sh
sudo chmod +x /mnt/stateful_partition/crouton/chroots/spotify/bin/setup.sh
sudo enter-chroot -n spotify setup.sh
sudo enter-chroot -b -n spotify spotify.sh
ssh-copy-id spotify@localhost
echo "Alias spotify='tmuxinator spotify' >> .zshenv"

# Reboot
echo "Rebooting in 10 sec ..."
sleep 10
sudo reboot
