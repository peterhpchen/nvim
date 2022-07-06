local present1, capabilities = pcall(require, 'lsp/capabilities')

if not present1 then
  return {}
end

local present2, on_attach = pcall(require, 'lsp/on_attach')

if not present2 then
  return {}
end

return {
  ['jsonls'] = {
    capabilities = capabilities,
    on_attach = on_attach,
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
  },
  ['eslint'] = {},
}
