local present, treesitter = pcall(require, 'nvim-treesitter.configs')

if not present then
  return
end

treesitter.setup({
  ensure_installed = {
    'dockerfile',
    'bash',
    'lua',
  },
  -- sync_install = true,
  highlight = { enable = true },
})
