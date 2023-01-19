local lspsaga_ok, saga = pcall(require, 'lspsaga')

if not lspsaga_ok then
  return
end

saga.setup({})

vim.api.nvim_set_keymap('n', 'gh', ':Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gs', ':Lspsaga signature_help<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', ':Lspsaga rename<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd', ':Lspsaga preview_definition<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', { noremap = true, silent = true })
