set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ARM9/arm-syntax-vim'

" " The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just:PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

imap jk <Esc>
imap JK <Esc>

syntax enable

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set ai
set si
set wrap

set showcmd
set cmdheight=2
set cursorline

set autoread

filetype indent on
filetype plugin on

set wildmenu
set wildignore=*.o,*.pyc
set lazyredraw

set showmatch
set incsearch
set hlsearch
set ignorecase
set magic
set mat=2

set so=999
set ruler

nnoremap<leader><space> :nohlsearch<CR>

set foldenable
set foldlevelstart=10
set foldnestmax=10

set number relativenumber

set nobackup
set nowb
set noswapfile

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim