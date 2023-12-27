local null_ls_ok, null_ls = pcall(require, 'null-ls')

if not null_ls_ok then
  return
end

local mason_null_ls_ok, mason_null_ls = pcall(require, 'mason-null-ls')

if not mason_null_ls_ok then
  return
end

mason_null_ls.setup({
  ensure_installed = {
    -- sh
    'shellcheck',
    'shfmt',

    -- dockerfile
    'hadolint',

    -- -- javascript
    -- 'prettierd',
    -- 'eslint_d',

    -- python
    'black',
    'isort',

    -- -- lua
    -- 'stylua',
  },
  automatic_installation = false,
  handlers = {
    prettierd = function(source_name, methods) end,
    eslint_d = function(source_name, methods) end,
    stylua = function(source_name, methods) end,
  },
})

null_ls.setup({
  on_attach = require('peterhpchen.lsp.on_attach'),
  -- sources = {
  --   null_ls.builtins.formatting.prettierd.with({
  --     extra_filetypes = { 'astro' },
  --   }),
  -- },
})
