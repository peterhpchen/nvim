return function(client, bufnr)
  vim.keymap.set('n', '<leader>f', function()
    local params = require('vim.lsp.util').make_formatting_params({})
    client.request('textDocument/formatting', params, nil, bufnr)
  end, { buffer = bufnr })
end
