local lspsaga_ok, saga = pcall(require, 'lspsaga')

if not lspsaga_ok then
  return
end

saga.setup({})

vim.keymap.set('n', 'gh', ':Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gs', ':Lspsaga signature_help<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gr', ':Lspsaga rename<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gd', ':Lspsaga preview_definition<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', { noremap = true, silent = true })
