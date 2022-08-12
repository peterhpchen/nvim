local present, treesitter = pcall(require, 'nvim-treesitter.configs')

if not present then
  return
end

treesitter.setup({
  ensure_installed = {
    'dockerfile',
    'bash',
    'lua',
    'json',
    'javascript',
    'vue',
    'rust',
    'python',
  },
  sync_install = true,
  highlight = { enable = true },
})
