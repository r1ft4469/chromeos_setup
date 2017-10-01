Chrome OS Setup Commands

====

1. Get Developer Mode
```
ESC+F3+Power
At Recovery Screen
CTRL+D
```
2. Run Inital Setup
3. Set Password
```
chromeos-setdevpassword
```
4. Setup
```
wget -q -O - https://raw.github.com/skycocker/chromebrew/master/install.sh | bash
crew install powerline_fonts
crew install tmux
crew install vim
crew install htop
crew install iftop
crew install screenfetch
crew install python27
crew install zsh
crew install util_linux 
wget -q -O - https://raw.githubusercontent.com/r1ft4469/chromeos_setup/master/env_setup.sh | bash
sudo su                                                                      
echo 1 >/var/lib/power_manager/disable_idle_suspend                          
chown power:power /var/lib/power_manager/disable_idle_suspend               
restart powerd                                                                 
exit             
sudo crouton -t cli-extra,audio -n spotify
sudo enter-chroot -n spotify
wget -q -O - https://apt.mopidy.com/mopidy.gpg | sudo apt-key add -
sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/jessie.list
sudo apt-get update
sudo apt-get install mopidy-spotify ncmpcpp netcat vim ssh
mkdir .config/mopidy
exit
cp ./.spotify_conf/playlist /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.ncmpcpp/
cp ./.spotify_conf/browser /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.ncmpcpp/
cp ./.spotify_conf/vis /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.ncmpcpp/
cp ./.spotify_conf/mopidy.conf /mnt/stateful_partition/crouton/chroots/spotify/home/spotify/.config/mopidy/
sudo cp ./.spotify_conf/spotify.sh /mnt/stateful_partition/crouton/chroots/spotify/bin/
sudo cp ./.spotify_conf/rc.local /mnt/stateful_partition/crouton/chroots/spotify/etc/
sudo enter-chroot -n spotify
sudo chmod +x /bin/spotify.sh
exit
sudo enter-chroot -b -n spotify spotify.sh
ssh-copy-id -i ~/.ssh/id_rsa.pub spotify@localhost
echo "Alias spotify='tmuxinator spotify' >> .zshenv
```
5. Restart
```
chrome://inducebrowsercrashforrealz
```
