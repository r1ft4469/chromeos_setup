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
sudo passwd chronos
```
3. Install Secure Shell
```
Target: chronos@>crosh
Pin
Open In Window
```
4. Setup crosh (Use CTL+SHIFT+J to open Java Console):
	In Java Console
```
var color_scheme = {
        'base00': '#002b36',
        'base01': '#073642',
        'base02': '#586e75',
        'base03': '#657b83',
        'base04': '#839496',
        'base05': '#93a1a1',
        'base06': '#eee8d5',
        'base07': '#fdf6e3',
        'base08': '#dc322f',
        'base09': '#cb4b16',
        'base0A': '#b58900',
        'base0B': '#859900',
        'base0C': '#2aa198',
        'base0D': '#268bd2',
        'base0E': '#6c71c4',
        'base0F': '#d33682',
};

term_.prefs_.set('background-color', color_scheme.base00);
term_.prefs_.set('foreground-color', color_scheme.base05);
term_.prefs_.set('cursor-color', "rgba(147, 161, 161, 0.5)");

term_.prefs_.set('color-palette-overrides', 
                        [color_scheme.base00,
                        color_scheme.base08,
                        color_scheme.base0B,
                        color_scheme.base0A,
                        color_scheme.base0D,
                        color_scheme.base0E,
                        color_scheme.base0C,
                        color_scheme.base05,
                        color_scheme.base03,
                        color_scheme.base08,
                        color_scheme.base0B,
                        color_scheme.base0A,
                        color_scheme.base0D,
                        color_scheme.base0E,
                        color_scheme.base0C,
                        color_scheme.base07,
                        color_scheme.base09,
                        color_scheme.base0F,
                        color_scheme.base01,
                        color_scheme.base02,
                        color_scheme.base04,
                        color_scheme.base06]);
```
	Open Settings (CTRL+SHIFT+P)
```
Font Size: 13
```
5. Install Crouton from [https://github.com/dnschneid/crouton]
6. Setup CHROOT for Kali-rolling
```
sudo sh ~/Downloads/crouton -e -r kali-rolling -t cli-extras
```
7. Install Kali Tools
```
sudo enter-chroot
sudo apt-get install kali-linux-full
sudo apt-get install vim
sudo apt-get install curl
sudo apt-get install git
```
8. Clone Repository in Downloads
```
cd ~/Downloads
git clone https://github.com/r1ft4469/chromeos_setup
git clone https://github.com/powerline/fonts
```
9. Add Powerline Fonts to Secure Shell
Open Settings (CTRL+SHIFT+P)
```
font-family: "Source Code Pro", monospace
user-css-text:
@font-face {
  font-family: 'Source Code Pro';
  font-style: normal;
  font-weight: normal;
  src: local('Source Code Pro'), url('https://github.com/powerline/fonts/blob/master/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf') format('opentype');
}
body {
  font-family: 'Source Code Pro' !important;
}
```
9. Setup Vim
```
sudo enter-chroot
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cat > ~/.vimrc << VIMRC
execute pathogen#infect()
syntax enable
set background=dark
set number
set showtabline=2
colorscheme solarized
filetype plugin indent on
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 0
let g:airline_solarized_bg='dark'
vmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>
VIMRC
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
cp -r ~/Downloads/chromeos_setup/chromeoscopy ./
```
10. Setup Git
```
git config --global user.name <USERNAME>
git config --global user.email <EMAIL>
git config --global core.editor vim
cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
echo GIT_PROMPT_ONLY_IN_REPO=1 >> .bashrc
echo GIT_PROMPT_THEME=Solarized >> .bashrc
echo source ~/.bash-git-prompt/gitprompt.sh >> .bashrc
```
11. Setup VPN
```
mkdir ~/vpn
cat > ~/vpn/vpn.sh << VPN
#!/bin/sh
stop shill && start shill BLACKLISTED DEVICES=tun0
VPN
echo openvpn --config ~/vpn/config.ovpn --auth-user-pass >> ~/vpn/vpn.sh
chmod +x openvpn
cp ~/Downloads/chromeos_setup/config.ovpn ~/vpn/
```
