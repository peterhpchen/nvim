local toggleterm_ok, toggleterm = pcall(require, 'toggleterm')

if not toggleterm_ok then
  return
end

toggleterm.setup()

local Terminal = require('toggleterm.terminal').Terminal
local chtsh = Terminal:new({
  cmd = 'cht.sh --shell',
  direction = 'float',
  hidden = true,
})

function _chtsh_toggle()
  chtsh:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>cht', '<cmd>lua _chtsh_toggle()<CR>', { noremap = true, silent = true })
