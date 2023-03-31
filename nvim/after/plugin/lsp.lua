local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
  'cmake',
  'jedi_language_server',
  'lua_ls',
  'clangd',
  'grammarly',
  'yamlls',
  'jsonls',
  'vimls',
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

