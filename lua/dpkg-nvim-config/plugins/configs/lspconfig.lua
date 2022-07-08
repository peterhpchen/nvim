local present, lua_dev = pcall(require, 'lua-dev')

if not present then
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

return {
  ['sumneko_lua'] = luadev,
}
