require('plugins')

vim.api.nvim_set_keymap('n', '<Leader>x', ':bd<CR>', { noremap = true, silent = true })

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.showmode = false
