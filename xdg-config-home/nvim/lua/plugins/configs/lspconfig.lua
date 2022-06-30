local present1, lspconfig = pcall(require, 'lspconfig')

if not present1 then
  return
end

local present2, lua_dev = pcall(require, 'lua-dev')

if not present2 then
  return
end

local present3, formatting_callback = pcall(require, 'lsp/formatting_callback')

if not present3 then
  return
end

-- Lua
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
lspconfig.sumneko_lua.setup(luadev)

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
  on_attach = function(client, bufnr)
    formatting_callback(client, bufnr)
  end,
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
