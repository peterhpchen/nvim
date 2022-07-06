local present1, lspconfig = pcall(require, 'lspconfig')

if not present1 then
  return
end

local lspconfigs = {
  ['dockerls'] = {},

  ['bashls'] = {},
}

local config = require('svim/core/default-config')
for _, ext in pairs(config.extensions) do
  local ext_lspconfigs_exists, ext_lspconfigs = pcall(require, ext .. '/plugins/configs/lspconfig')
  if ext_lspconfigs_exists then
    lspconfigs = vim.tbl_deep_extend('force', lspconfigs, ext_lspconfigs)
  end
end

for cur_lspname, cur_lspconfig in pairs(lspconfigs) do
  lspconfig[cur_lspname].setup(cur_lspconfig)
end
