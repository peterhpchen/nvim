local keymap = vim.keymap

keymap.set('n', '<Leader>x', ':bd<CR>', { desc = 'close buffer' })
keymap.set('n', '<Leader>xa', ':%bd|e#|bd#<CR>', { desc = 'close all buffers except current' })

-- undotree
keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'toggle undotree panel' })
