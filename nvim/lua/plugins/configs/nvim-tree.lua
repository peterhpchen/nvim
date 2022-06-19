local present, nvim_tree = pcall(require, 'nvim-tree')

if not present then
  return
end

nvim_tree.setup({})

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
