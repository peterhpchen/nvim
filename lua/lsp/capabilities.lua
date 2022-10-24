local present, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

local capabilities = vim.lsp.protocol.make_client_capabilities()
if present then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return capabilities
