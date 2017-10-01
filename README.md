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
sudo apt-get install mopidy-spotify ncmpcpp netcat vim
mkdir .config/mopidy
exit

cp ./.spotify_conf/top /mnt/stateful_partition/crouton/chroots/ncmpcpp/home/spotify/.ncmpcpp/
cp ./.spotify_conf/bottom /mnt/stateful_partition/crouton/chroots/ncmpcpp/home/spotify/.ncmpcpp/
cp ./.spotify_conf/mopidy.conf /mnt/stateful_partition/crouton/chroots/ncmpcpp/home/spotify/.config/mopidy/
cp ./.spotify_conf/spotify_start.sh /mnt/stateful_partition/crouton/chroots/ncmpcpp/home/spotify/
echo "Alias spotify='
```
5. Restart
```
chrome://inducebrowsercrashforrealz
```
