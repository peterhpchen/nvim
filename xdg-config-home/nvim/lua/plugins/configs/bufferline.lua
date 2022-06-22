local present, bufferline = pcall(require, 'bufferline')

if not present then
  return
end

bufferline.setup({
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
    offsets = {
      {
        filetype = 'NvimTree',
      },
    },
  },
})

vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrevious<CR>', { noremap = true, silent = true })
