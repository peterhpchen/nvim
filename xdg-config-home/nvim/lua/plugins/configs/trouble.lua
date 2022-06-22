local present, trouble = pcall(require, 'trouble')

if not present then
  return
end

trouble.setup({})

vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true })
