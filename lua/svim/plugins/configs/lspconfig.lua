local present1, lspconfig = pcall(require, 'lspconfig')

if not present1 then
  return
end

local present2, lua_dev = pcall(require, 'lua-dev')

if not present2 then
  return
end

local utils = require('svim.core.utils')

local lspconfigs = {
  ['dockerls'] = {},

  ['bashls'] = {},

  ['sumneko_lua'] = lua_dev.setup({
    lspconfig = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    },
  })
}

local config = utils.load_config()
for _, ext in pairs(config.extensions) do
  local ext_lspconfigs_exists, ext_lspconfigs = pcall(require, ext .. '/plugins/configs/lspconfig')
  if ext_lspconfigs_exists then
    lspconfigs = vim.tbl_deep_extend('force', lspconfigs, ext_lspconfigs)
  end
end

for cur_lspname, cur_lspconfig in pairs(lspconfigs) do
  lspconfig[cur_lspname].setup(cur_lspconfig)
end
