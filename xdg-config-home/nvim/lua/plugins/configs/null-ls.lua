local present, null_ls = pcall(require, 'null-ls')

if not present then
  return
end

local formatting_callback = function(client, bufnr)
  vim.keymap.set('n', '<leader>f', function()
    local params = require('vim.lsp.util').make_formatting_params({})
    client.request('textDocument/formatting', params, nil, bufnr)
  end, {buffer = bufnr})
end

null_ls.setup({
  on_attach = function(client, bufnr)
    formatting_callback(client, bufnr)
  end,
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
