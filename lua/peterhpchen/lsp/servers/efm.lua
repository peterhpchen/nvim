local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_ok then
  print('require lspconfig error')
  return
end

local prettier_d_ok, prettier_d = pcall(require,
  'efmls-configs.formatters.prettier_d')

if not prettier_d_ok then
  print('require prettier_d error')
  return
end

local stylua_ok, stylua = pcall(require, 'efmls-configs.formatters.stylua')

if not stylua_ok then
  print('require stylua error')
  return
end

local shellcheck_ok, shellcheck = pcall(require,
  'efmls-configs.linters.shellcheck')

if not shellcheck_ok then
  print('require shellcheck error')
  return
end

local shfmt_ok, shfmt = pcall(require, 'efmls-configs.formatters.shfmt')

if not shfmt_ok then
  print('require shfmt error')
  return
end

local hadolint_ok, hadolint = pcall(require, 'efmls-configs.linters.hadolint')

if not hadolint_ok then
  print('require hadolint error')
  return
end

local black_ok, black = pcall(require, 'efmls-configs.formatters.black')

if not black_ok then
  print('require black error')
  return
end

local isort_ok, isort = pcall(require, 'efmls-configs.formatters.isort')

if not isort_ok then
  print('require isort error')
  return
end

-- local cspell_ok, cspell = pcall(require, 'efmls-configs.linters.cspell')
--
-- if not cspell_ok then
--   print('require cspell error')
--   return
-- end
--
local languages = {
  javascript = { prettier_d },
  javascriptreact = { prettier_d },
  typescript = { prettier_d },
  typescriptreact = { prettier_d },
  markdown = {
    prettier_d,
    -- cspell,
  },
  lua = { stylua },
  sh = { shellcheck, shfmt },
  docker = { hadolint },
  python = { black, isort },
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
