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


" Remapped commands
nnoremap<leader><space> :nohlsearch<CR>
imap jk <Esc>
imap JK <Esc>

syntax enable
set background=dark
set ffs=unix
set colorcolumn=120

" Tab spacing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Smart spacing
set ai
set si
set wrap

" Cmd line
set showcmd
set cmdheight=2
set cursorline
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Reload file when there are changes
set autoread

filetype indent on
filetype plugin on

" Wild menu
set wildmenu
set wildignore=*.o,*.pyc
set lazyredraw

" Search
set showmatch
set incsearch
set hlsearch
set ignorecase
set magic
set mat=2

" Ruler
set so=999
set ruler

" Fold
set foldenable 
set foldlevelstart=10
set foldnestmax=10
setlocal foldmethod=syntax

" Numbering
set number relativenumber

" Extra files
set nobackup
set nowb
set noswapfile

" Buff Explorer
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSplitOutPathName=1 
let g:bufExplorerSortBy='fullpath'
let g:bufExplorerShowTabBuffer=1
nnoremap <silent> <F9> :BufExplorer<CR>

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_open_multiple_files='i'
let g:ctrlp_show_hidden=1
let g:ctrlp_mruf_case_sensitive=0
let g:ctrlp_mruf_relative=1

" Git diff colors
if &diff
    highlight DiffAdd    term=bold         ctermbg=darkgreen ctermfg=white    cterm=bold guibg=DarkGreen  guifg=White    gui=bold
    highlight DiffText   term=reverse,bold ctermbg=red       ctermfg=yellow   cterm=bold guibg=DarkRed    guifg=yellow   gui=bold
    highlight DiffChange term=bold         ctermbg=black     ctermfg=white    cterm=bold guibg=Black      guifg=White    gui=bold
    highlight DiffDelete term=none         ctermbg=darkblue  ctermfg=darkblue cterm=none guibg=DarkBlue   guifg=DarkBlue gui=none
endif
