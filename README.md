Chrome OS Setup Commands

====

1. Run Inital Setup
2. Get Developer Mode
3. Set 
3. Install Secure Shell
4. Setup crosh:
	a. Press CTRL+SHIFT+J
	b. Paste:
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
5. Install Powerline Font:
```
sudo mkdir -p /usr/local/share/fonts
sudo wget -P /usr/local/share/fonts https://raw.github.com/Lokaltog/powerline/develop/font/PowerlineSymbols.otf
mkdir -p /tmp/test/
sudo mount --bind /home/chronos/ /tmp/test/
cd /tmp/test/user
cat > .fonts.conf << FONTS
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
	<dir>/usr/local/share/fonts</dir>
</fontconfig>
FONTS
```
6. Install Crouton from [https://github.com/dnschneid/crouton]
7. Setup CHROOT for Kali-rolling
```
sudo sh ~/Downloads/crouton -e -r kali-rolling -t cli-extras
```
8. Install Kali Tools
```
sudo enter-chroot
sudo apt-get install kali-linux-full
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
colorscheme solarized
filetype plugin indent on
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
VIMRC
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
```
10. Setup Git
```
git config --global user.name "r1ft4469"
git config --global user.email pennoser@gmail.com
git config --global core.editor vim
cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
echo GIT_PROMPT_ONLY_IN_REPO=1 >> .bashrc
echo source ~/.bash-git-prompt/gitprompt.sh >> .bashrc
echo GIT_PROMPT_THEME=Solarized >> .bashrc
```