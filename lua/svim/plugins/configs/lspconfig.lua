local present1, lspconfig = pcall(require, 'lspconfig')

if not present1 then
  return
end

local present2, lua_dev = pcall(require, 'lua-dev')

if not present2 then
  return
end

lspconfig.dockerls.setup({})

lspconfig.bashls.setup({})

lspconfig.sumneko_lua.setup(lua_dev.setup({
  lspconfig = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  },
}))
