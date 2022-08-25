local treesitter_ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if not treesitter_ok then
  return
end

treesitter.setup({
  ensure_installed = {
    'astro',
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
    'typescript',
    'vue',
    'yaml',
  },
  -- install sync for install script
  sync_install = true,
  auto_install = true,

  highlight = { enable = true },
  context_commentstring = {
    enable = true,
    config = {
      astro = '<!-- %s -->',
    },
    enable_autocmd = false,
  },
})
