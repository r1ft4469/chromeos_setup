Chrome OS Setup Commands

====

1. Get Developer Mode
```
ESC+F3+Power
At Recovery Screen
CTRL+D
```
2. Set Password
```
CTRL+ALT+F2
user: chronos
pass: chrome
sudo su
chromeos-setdevpasswd
```
3. Run Inital Setup
4. Install Dependancies
```
wget -q -O - https://raw.github.com/skycocker/chromebrew/master/install.sh | bash
crew install powerline_fonts tmux vim htop screenfetch python27 zsh util_linux netcat libtool glib autoconf
```
4. Setup Github Keys
```
git config --global user.name <GITHUB Username>
git config --global user.email <GITHUB Email>
ssh-keygen -t rsa -b 4096 -C <GITHUB Email>
# Add Key to <https://github.com/settings/keys>
```
4. Setup
```
wget -q -O - https://raw.githubusercontent.com/r1ft4469/chromeos_setup/master/env_setup.sh | bash
# Wait for Reboot
mkdir -p /tmp/test
sudo mount --bind /home/chronos /tmp/test/
cd /tmp/test/user
cp ~/.fonts.con .
sudo reboot
```
5. Setup Power Management
```
sudo su                                                                      
echo 1 >/var/lib/power_manager/disable_idle_suspend                          
chown power:power /var/lib/power_manager/disable_idle_suspend               
restart powerd                                                                 
```
6. Setup Spotify
```
vim .spotify_conf/mopidy.conf
# Fill in Fields at Bottom
sudo crouton -t cli-extra,audio, -n spotify
mkdir /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.config
mkdir /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.config/mopidy
mkdir /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.ncmpcpp
cp ./.spotify_conf/playlist /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.ncmpcpp/
cp ./.spotify_conf/browser /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.ncmpcpp/
cp ./.spotify_conf/vis /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.ncmpcpp/
cp ./.spotify_conf/mopidy.conf /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.config/mopidy/
sudo cp ./.spotify_conf/spotify.sh /mnt/stateful_partition/crouton/chroots/spotify/bin/
sudo cp ./.spotify_conf/rc.local /mnt/stateful_partition/crouton/chroots/spotify/etc/
sudo chmod +x /mnt/stateful_partition/crouton/chroots/spotify/bin/spotify.sh
sudo enter-chroot -n spotify
wget -q -O - https://apt.mopidy.com/mopidy.gpg | sudo apt-key add -
sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/jessie.list
sudo apt-get update
sudo apt-get install mopidy-spotify vim ssh ncmpcpp
vim .spotify_conf/mopidy.conf
# Fill in Fields at Bottom for key go here: <https://www.mopidy.com/authenticate/#spotify>
exit
sudo enter-chroot -b -n spotify spotify.sh
ssh-copy-id spotify@localhost
echo "Alias spotify='tmuxinator spotify' >> .zshenv"
```
