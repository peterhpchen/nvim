local present, lspconfig = pcall(require, 'lspconfig')

if not present then
  return
end

lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

lspconfig.dockerls.setup({})
