local present, telescope = pcall(require, 'telescope')

if not present then
  return
end

telescope.setup({})

vim.keymap.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>', { noremap = true, silent = true, desc = 'Find File' })
vim.keymap.set(
  'n',
  '<leader>fa',
  '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>',
  { noremap = true, silent = true }
)
vim.keymap.set('n', '<leader>fw', '<cmd> Telescope live_grep <CR>', { noremap = true, silent = true, desc = 'Find Content' })
vim.keymap.set('n', '<leader>fb', '<cmd> Telescope buffers <CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', '<cmd> Telescope help_tags <CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tk', '<cmd> Telescope keymaps <CR>', { noremap = true, silent = true })
