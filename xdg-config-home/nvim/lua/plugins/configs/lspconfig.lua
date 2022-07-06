local present1, lspconfig = pcall(require, 'lspconfig')

if not present1 then
  return
end

local present2, lua_dev = pcall(require, 'lua-dev')

if not present2 then
  return
end

local luadev = lua_dev.setup({
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

local lspconfigs = {
  ['sumneko_lua'] = luadev,

  ['dockerls'] = {},

  ['bashls'] = {},
}

local config = require('svim/core/default-config')
for _, ext in pairs(config.extensions) do
  local ext_lspconfig = require(ext .. '/plugins/configs/lspconfig')
  lspconfigs = vim.tbl_deep_extend('force', lspconfigs, ext_lspconfig)
end

for curlspname, curlspconfig in pairs(lspconfigs) do
  lspconfig[curlspname].setup(curlspconfig)
end
