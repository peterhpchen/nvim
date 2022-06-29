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

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = vim.list_extend(
        {
          {
            description = 'Google Chrome extension manifest file',
            fileMatch = { 'manifest.json' },
            name = 'Chrome Extension',
            url = 'https://json.schemastore.org/chrome-manifest.json',
          },
        },
        require('schemastore').json.schemas({
          select = {},
        })
      ),
      validate = { enable = true },
    },
  },
})
