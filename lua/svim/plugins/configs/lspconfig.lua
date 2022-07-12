local present1, lspconfig = pcall(require, 'lspconfig')

if not present1 then
  return
end

local present2, lua_dev = pcall(require, 'lua-dev')

if not present2 then
  return
end

local present3, schemastore = pcall(require, 'schemastore')

if not present3 then
  return
end

local present4, capabilities = pcall(require, 'svim/lsp/capabilities')

if not present4 then
  return {}
end

local present5, on_attach = pcall(require, 'svim/lsp/on_attach')

if not present5 then
  return {}
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

lspconfig.jsonls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    json = {
      schemas = vim.list_extend({
        {
          description = 'Google Chrome extension manifest file',
          fileMatch = { 'manifest.json' },
          name = 'Chrome Extension',
          url = 'https://json.schemastore.org/chrome-manifest.json',
        },
      }, require('schemastore').json.schemas()),
      validate = { enable = true },
    },
  },
})

lspconfig.eslint.setup({})
