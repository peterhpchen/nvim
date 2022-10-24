require('core.options')
require('core.autocmds')
require('plugins')

-- diagnostic
vim.diagnostic.config({ severity_sort = true })
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
