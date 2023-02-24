local present, nvim_tree = pcall(require, 'nvim-tree')

if not present then
  return
end

nvim_tree.setup({
  disable_netrw = true,
  open_on_setup = false,
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    custom = { '^.git$' },
  },
})

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
