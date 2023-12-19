local keymap = vim.keymap

keymap.set('n', '<Leader>x', ':bd<CR>', { desc = 'close buffer' })
keymap.set('n', '<Leader>xa', ':%bd|e#<CR>', { desc = 'close all buffers' })

-- undotree
keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'toggle undotree panel' })

-- trouble
keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { desc = 'toggle trouble list' })

-- telescope
keymap.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>', { desc = 'find file' })
keymap.set('n', '<leader>fw', '<cmd> Telescope live_grep <CR>', { desc = 'find content' })
keymap.set('n', '<leader>fh', '<cmd> Telescope help_tags <CR>', { desc = 'find help' })
