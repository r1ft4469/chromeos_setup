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
