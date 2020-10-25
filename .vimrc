set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
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
Plugin 'fatih/vim-go'
Plugin 'neoclide/coc.nvim'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
Plugin 'habamax/vim-godot'

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
nnoremap<leader>c :noh<CR>
nnoremap<leader>f za<CR>
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
let g:airline_theme='deus'

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
nnoremap <leader>/ :Lines<CR>
nnoremap <leader>p :Files <CR>
nnoremap <C-p> :GFiles<CR>
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

" COC settings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <CR> complete_info().selected != -1 ?
            \ &filetype == "gdscript" ? (coc#expandable() ?  "\<C-y>" : "\<Esc>a") : "\<C-y>"
            \ : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" End of COC settings

" COC highlight
hi CocFloating ctermbg=black
hi CocWarningFloat ctermbg=black ctermfg=yellow

" Git diff colors
if &diff
    set noro
    highlight DiffAdd    term=bold         ctermbg=darkgreen ctermfg=white    cterm=bold guibg=DarkGreen  guifg=White    gui=bold
    highlight DiffText   term=reverse,bold ctermbg=red       ctermfg=yellow   cterm=bold guibg=DarkRed    guifg=yellow   gui=bold
    highlight DiffChange term=bold         ctermbg=black     ctermfg=white    cterm=bold guibg=Black      guifg=White    gui=bold
    highlight DiffDelete term=none         ctermbg=darkblue  ctermfg=darkblue cterm=none guibg=DarkBlue   guifg=DarkBlue gui=none
endif

" PEP 8 indentation
au BufNewFile, BufRead *.py, *.gd
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set foldmethod=indent

" Full stack development
au BufRead, BufNewFile *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Markdown
au BufNewFile, BufRead *.md
    \ set textwidth=80

" Markdown instant
let g:instant_markdown_autoscroll = 0
let g:instant_markdown_browser = "chrome"
let g:instant_markdown_mathjax = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'

" Flag unnecessary whitespace
hi BadWhitespace ctermbg=red guibg=red
au BufRead, BufNewFile *rc,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Vim Go settings
let g:go_gopls_enabled = 0

" python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'venv/bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
