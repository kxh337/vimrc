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
Plugin 'ARM9/arm-syntax-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'nvie/vim-flake8'
Plugin 'idanarye/vim-vebugger'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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
let mapleader = "\<Space>"
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
let g:airline_theme='dues'

" Reload file when there are changes
set autoread

filetype indent on
filetype plugin on

" Wild menu
set wildmenu
set wildignore=*.o,*.pyc
set lazyredraw
set vb t_vb=

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

" Sessions
let g:session_dir = '~/.vim/sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'

" Spelling
set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
hi clear SpellBad
hi clear SpellRare
hi clear SpellCap
hi clear SpellLocal
hi SpellBad cterm=underline gui=undercurl
hi SpellRare cterm=underline gui=undercurl
hi SpellCap cterm=underline gui=undercurl
hi SpellLocal cterm=underline gui=undercurl

" Split navigations shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vim gitgutter settings
set updatetime=100
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
highlight SignColumn guibg=grey ctermbg=grey

" FZF setting
nnoremap <leader><leader> :Commands<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>t :Tags<CR>

" csope setting
if has ("csope")
    set csprg=/usr/local/bin/csope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("csope.out")
        cs add csope.out
    " else add database pointed to by environment
    elseif $CSOPE_DB != ""
        cs add $CSOPE_DB
    endif
    set csverb
endif

" Nerd tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" YCM
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("/opt/clang+llvm-10.0.0/bin/clang")

" Git diff colors
if &diff
    set noro
    highlight DiffAdd    term=bold         ctermbg=darkgreen ctermfg=white    cterm=bold guibg=DarkGreen  guifg=White    gui=bold
    highlight DiffText   term=reverse,bold ctermbg=red       ctermfg=yellow   cterm=bold guibg=DarkRed    guifg=yellow   gui=bold
    highlight DiffChange term=bold         ctermbg=black     ctermfg=white    cterm=bold guibg=Black      guifg=White    gui=bold
    highlight DiffDelete term=none         ctermbg=darkblue  ctermfg=darkblue cterm=none guibg=DarkBlue   guifg=DarkBlue gui=none
endif

" PEP 8 indentation
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set foldmethod=indent

" Full stack development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Markdown
au BufNewFile,BufRead *.md
    \ set textwidth=80

" Flag unnecessary whitespace
hi BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *rc,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'venv/bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
