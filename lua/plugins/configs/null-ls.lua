local null_ls_ok, null_ls = pcall(require, 'null-ls')

if not null_ls_ok then
  return
end

null_ls.setup({
  on_attach = require('lsp.on_attach'),
  sources = {
    -- Dockerfile
    null_ls.builtins.diagnostics.hadolint,

    -- Shell
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.shfmt,

    -- Lua
    null_ls.builtins.formatting.stylua,
  },
})
