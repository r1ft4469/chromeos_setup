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
chromeos-setdevpassword
```
3. Run Inital Setup
4. Install Dependancies
```
wget -q -O - https://raw.github.com/skycocker/chromebrew/master/install.sh | bash
crew install powerline_fonts tmux vim htop screenfetch python27 zsh util_linux 
```
4. Setup Github Keys
```
export gituser=<GITHUB USERNAME>
export gitemail=<GITHUB EMAIL>
ssh-keygen -t rsa -b 4096 -C $gitemail
# Add Key to <https://github.com/settings/keys>
```
4. Setup
```
wget -q -O - https://raw.githubusercontent.com/r1ft4469/chromeos_setup/master/env_setup.sh | bash
sudo su                                                                      
echo 1 >/var/lib/power_manager/disable_idle_suspend                          
chown power:power /var/lib/power_manager/disable_idle_suspend               
restart powerd                                                                 
```
