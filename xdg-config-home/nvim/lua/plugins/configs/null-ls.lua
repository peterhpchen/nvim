local present, null_ls = pcall(require, 'null-ls')

if not present then
  return
end

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          local params = require('vim.lsp.util').make_formatting_params({})
          client.request('textDocument/formatting', params, nil, bufnr)
        end,
      })
    end
  end,
  sources = {
    -- Dockerfile
    null_ls.builtins.diagnostics.hadolint,

    -- Lua
    null_ls.builtins.formatting.stylua,
  },
})
