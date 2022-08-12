local present, treesitter = pcall(require, 'nvim-treesitter.configs')

if not present then
  return
end

treesitter.setup({
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'html',
    'javascript',
    'json',
    'lua',
    'python',
    'rust',
    'toml',
    'vue',
    'yaml',
  },
  -- install sync for install script
  sync_install = true,
  highlight = { enable = true },
})
