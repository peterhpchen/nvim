local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_ok then
  return
end

local neodev_ok, neodev = pcall(require, 'neodev')

if neodev_ok then
  neodev.setup({})
end

lspconfig.lua_ls.setup({})
