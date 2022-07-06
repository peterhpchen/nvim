local present1, null_ls = pcall(require, 'null-ls')

if not present1 then
  return
end

local present2, on_attach = pcall(require, 'lsp/on_attach')

if not present2 then
  return
end

null_ls.setup({
  on_attach = on_attach,
  sources = {
    -- Dockerfile
    null_ls.builtins.diagnostics.hadolint,

    -- Lua
    null_ls.builtins.formatting.stylua,

    -- Shell
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.shfmt,
  },
})
