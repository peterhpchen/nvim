local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_ok then
  return
end

local server_config = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}

local lua_dev_ok, lua_dev = pcall(require, 'lua-dev')

if lua_dev_ok then
  server_config = lua_dev.setup({
    lspconfig = server_config,
  })
end

lspconfig.sumneko_lua.setup(server_config)
