require('plugins')

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>c', '<cmd>noh<cr>')
vim.keymap.set('n', '<leader>f', 'za')

vim.o.termguicolors = true
vim.opt.background = 'dark'
vim.opt.ffs = 'unix' vim.cmd("colorscheme NeoSolarized")
vim.opt.encoding = "UTF-8"
vim.opt.guifont = "NotoMono Nerd Font Regular 11"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.breakindent = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabbing
vim.api.nvim_buf_set_option(0, 'tabstop', 4)
vim.api.nvim_buf_set_option(0, 'softtabstop', 4)
vim.api.nvim_buf_set_option(0, 'shiftwidth', 4)
vim.api.nvim_buf_set_option(0, 'expandtab', true)

-- Smart spacing
vim.opt.wrap = true
vim.opt.ai = true
vim.opt.si = true

-- Cmd line
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2

-- Reload file when there are changes
vim.opt.autoread = true

-- Wild menu
vim.opt.wildmenu = true
vim.opt.wildignore = '*.o', '*.pyc'
vim.opt.lazyredraw = true
vim.opt.vb = nil

-- Search
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.magic = true
vim.opt.mat = 2

-- Fold
vim.opt.foldenable = true
vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 10

-- Ruler
vim.opt.ruler = true
vim.opt.so = 999

-- Extra Files
vim.o.nobackup = true
vim.o.nowb = true
vim.o.noswapfile = true

-- Sessions
session_dir = '~/.config/nvim/sessions'
vim.keymap.set('n', '<leader>ss', ':mks! ' .. session_dir .. '/*.vim<C-D><BS><BS><BS><BS><BS>')
vim.keymap.set('n', '<leader>sr', ':so ' .. session_dir .. '/*.vim<C-D><BS><BS><BS><BS><BS>')

-- Spelling
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.opt.spellfile = '~/.vim/spell/en.utf-8.add'
-- Spelling highligt
vim.api.nvim_set_hl(0, 'SpellBad', {underline=true, undercurl=true})
vim.api.nvim_set_hl(0, 'SpellRare', {underline=true, undercurl=true})
vim.api.nvim_set_hl(0, 'SpellCap', {underline=true, undercurl=true})
vim.api.nvim_set_hl(0, 'SpellLocal', {underline=true, undercurl=true})

-- Window management
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')

-- Window shortcuts
vim.keymap.set('n', '<leader>c', '<cmd>noh<cr>')

-- Nerd tree
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')
vim.o.NERDTreeShowHidden = true

-- Vimspector settings
vim.keymap.set('n', '<leader>dd', ':call vimspector#Launch()<CR>')
vim.keymap.set('n', '<leader>dr', ':call vimspector#Reset()<CR>')
vim.keymap.set('n', '<leader>dc', ':call vimspector#Continue()<CR>')

vim.keymap.set('n', '<leader>dt', ':call vimspector#ToggleBreakpoint()<CR>')
vim.keymap.set('n', '<leader>dT', ':call vimspector#ClearBreakpoints()<CR>')

vim.keymap.set('n', '<leader>dk', '<Plug>VimspectorRestart')
vim.keymap.set('n', '<leader>dh', '<Plug>VimspectorStepOut')
vim.keymap.set('n', '<leader>dl', '<Plug>VimspectorStepInto')
vim.keymap.set('n', '<leader>dj', '<Plug>VimspectorStepOver')

-- TreeSitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {"c", "cpp", "python", "lua", "vim", "help", "query", "markdown"},
  sync_install = true,
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,
    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr='nvim_treesitter#foldexpr()'
vim.o.nofoldenable = true

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tp', builtin.git_files, {})
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
