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
set tabstop=2 expandtab softtabstop=2 shiftwidth=2
let g:solarized_termcolors=16
colorscheme solarized
filetype plugin indent on
set rtp+=/Users/raguay/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
:cnoreabbrev wq w<bar>bd
:cnoreabbrev q bd
set nocompatible

nnoremap <F1> :bn<CR>
nnoremap <F2> :bN<CR>

function! NERDTreeToggleInCurDir()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction
nmap <silent> <C-o> :call NERDTreeToggleInCurDir()<cr>

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
let g:VimPyServer_autostart=1
