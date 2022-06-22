local present, null_ls = pcall(require, 'null-ls')

if not present then
  return
end

null_ls.setup({
  on_attach = function(client, bufnr)
    vim.keymap.set('n', '<leader>f', function()
      local params = require('vim.lsp.util').make_formatting_params({})
      client.request('textDocument/formatting', params, nil, bufnr)
    end, { buffer = bufnr })
  end,
  sources = {
    -- Dockerfile
    null_ls.builtins.diagnostics.hadolint,

    -- Lua
    null_ls.builtins.formatting.stylua,
  },
})
