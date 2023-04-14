local present, bufferline = pcall(require, 'bufferline')

if not present then
  return
end

bufferline.setup({
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
    offsets = {},
  },
})

vim.keymap.set('n', '<TAB>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
