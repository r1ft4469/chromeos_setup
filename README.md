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
4. Setup
```
wget -q -O - https://raw.githubusercontent.com/r1ft4469/chromeos_setup/master/env_setup.sh | bash
sudo su                                                                      
echo 1 >/var/lib/power_manager/disable_idle_suspend                          
chown power:power /var/lib/power_manager/disable_idle_suspend               
restart powerd                                                                 
```
