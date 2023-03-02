local toggleterm_ok, toggleterm = pcall(require, 'toggleterm')

if not toggleterm_ok then
  return
end

toggleterm.setup()

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require('toggleterm.terminal').Terminal
local chtsh = Terminal:new({
  cmd = 'cht.sh --shell',
  direction = 'float',
  hidden = true,
})

function _chtsh_toggle()
  chtsh:toggle()
end

vim.keymap.set('n', '<leader>cht', '<cmd>lua _chtsh_toggle()<CR>', { noremap = true, silent = true })
