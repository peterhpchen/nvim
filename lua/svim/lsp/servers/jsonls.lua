local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_ok then
  return
end

local schemas = {
  {
    description = 'Google Chrome extension manifest file',
    fileMatch = { 'manifest.json' },
    name = 'Chrome Extension',
    url = 'https://json.schemastore.org/chrome-manifest.json',
  },
}

local schemastore_ok, schemastore = pcall(require, 'schemastore')

if schemastore_ok then
  schemas = vim.list_extend(schemas, schemastore.json.schemas())
end

lspconfig.jsonls.setup({
  capabilities = require('svim/lsp/capabilities'),
  on_attach = require('svim/lsp/on_attach'),
  settings = {
    json = {
      schemas = schemas,
      validate = { enable = true },
    },
  },
})
