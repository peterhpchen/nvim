vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 999
vim.opt.signcolumn = 'yes'

-- indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.showmode = false

vim.opt.clipboard = 'unnamedplus'

vim.opt.mouse = nil

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false -- Disable folding at startup.
