local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_ok then
  return
end

local prettier_d_ok, prettier_d = pcall(require, 'efmls-configs.formatters.prettier_d')

if not prettier_d_ok then
  return
end

local languages = {
  javascript = { prettier_d },
  javascriptreact = { prettier_d },
  typescript = { prettier_d },
  typescriptreact = { prettier_d },
  markdown = { prettier_d },
}

local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

lspconfig.efm.setup(vim.tbl_extend('force', efmls_config, {
  -- Pass your custom lsp config below like on_attach and capabilities
  --
  on_attach = require('peterhpchen.lsp.on_attach'),
}))
