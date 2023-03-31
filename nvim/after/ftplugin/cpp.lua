-- Tabbing
vim.api.nvim_buf_set_option(0, 'tabstop', 2)
vim.api.nvim_buf_set_option(0, 'softtabstop', 2)
vim.api.nvim_buf_set_option(0, 'shiftwidth', 2)
vim.api.nvim_buf_set_option(0, 'expandtab', true)

vim.opt.colorcolumn = '121'
vim.opt.textwidth = 120
vim.api.nvim_set_hl(0, 'ColorColumn', {bg='Red'})
