execute pathogen#infect()
syntax enable
set background=dark
set number
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set ruler
set wildmenu
set showtabline=2
set laststatus=2
set tabstop=4
let g:solarized_termcolorsi=256
colorscheme solarized
filetype plugin indent on
vmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>
nmap <C-o> :Explore<CR>
set rtp+=/Users/raguay/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

" These lines setup the environment to show graphics and colors correctly.
set nocompatible

let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif

set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)