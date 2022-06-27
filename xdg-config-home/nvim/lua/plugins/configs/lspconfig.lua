local present, lspconfig = pcall(require, 'lspconfig')

if not present then
  return
end

-- Lua
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

-- Dockerfile
lspconfig.dockerls.setup({})

-- Vue
lspconfig.volar.setup({})

-- Shell
lspconfig.bashls.setup({})

lspconfig.taplo.setup({})
