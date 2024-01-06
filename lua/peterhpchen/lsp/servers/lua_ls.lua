local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_ok then
  return
end

local neodev_ok, neodev = pcall(require, 'neodev')

if not neodev_ok then
  return
end

neodev.setup({})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
})
