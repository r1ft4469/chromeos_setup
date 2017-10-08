" Pathogen
execute pathogen#infect()
syntax enable

" Settings
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
set expandtab 
set softtabstop=4 
set shiftwidth=4
set hidden
set nocompatible
set autochdir
set laststatus=2
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode


" Binds
:cnoreabbrev wq w<bar>bd
:cnoreabbrev q bd
nnoremap <F1> :bn<CR>
nnoremap <F2> :bN<CR>
map <silent> <C-o> :call ToggleNetrw()<CR>

" Color Scheme
let g:solarized_termcolors=16
colorscheme solarized
filetype plugin indent on

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Netrw
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_banner=0
let g:netrw_browse_split=4

" Powerline
set rtp+=/Users/raguay/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" VimPyServer
let g:VimPyServer_autostart=1
