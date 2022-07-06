local present, default_plugins = pcall(require, 'svim/plugins')

if not present then
  return
end

local lspconfig_after = default_plugins['neovim/nvim-lspconfig'].after
table.insert(lspconfig_after, 'schemastore.nvim')

return {
  ['b0o/schemastore.nvim'] = {},
  ['neovim/nvim-lspconfig'] = {
    after = lspconfig_after,
  },
}
