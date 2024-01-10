local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_ok then
  return
end

local schemas = {}

local schemastore_ok, schemastore = pcall(require, 'schemastore')

if schemastore_ok then
  schemas = schemastore.json.schemas({ extra = schemas })
end

lspconfig.jsonls.setup({
  capabilities = require('peterhpchen.lsp.capabilities'),
  on_attach = require('peterhpchen.lsp.on_attach'),
  settings = {
    json = {
      schemas = schemas,
      validate = { enable = true },
    },
  },
})
