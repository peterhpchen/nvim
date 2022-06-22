local present, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not present then
  return
end

lsp_installer.setup({
  -- ensure_installed = { 'dockerls' },
  -- automatic_installation = true,
})
