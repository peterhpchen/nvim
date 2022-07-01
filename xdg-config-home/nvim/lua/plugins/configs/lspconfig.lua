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

local present4, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not present4 then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

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

lspconfig.dockerls.setup({})

lspconfig.bashls.setup({})

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
          select = { '.eslintrc' },
        })
      ),
      validate = { enable = true },
    },
  },
})

lspconfig.eslint.setup({})
