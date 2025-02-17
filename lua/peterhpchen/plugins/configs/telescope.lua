local present, telescope = pcall(require, 'telescope')

if not present then
  return
end

local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    layout_strategy = 'vertical',
  },
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require('telescope').load_extension('file_browser')

vim.keymap.set('n', '<space>fb', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    grouped = true,
    select_buffer = true,
    hidden = true,
    respect_gitignore = false,
    initial_mode = 'normal',
    previewer = false,
  })
end, { desc = 'open file browser' })

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find file' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'find content' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'find buffer' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'find help' })
