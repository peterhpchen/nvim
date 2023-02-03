local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then
  return
end

vim.cmd('packadd packer.nvim')

packer.startup(function(use)
  use('wbthomason/packer.nvim')

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use('JoosepAlviste/nvim-ts-context-commentstring')

  -- Lua
  use('folke/neodev.nvim')

  -- JSON
  use('b0o/schemastore.nvim')
  -- disable because bug issue https://github.com/vuki656/package-info.nvim/issues/127
  -- use({
  --   'vuki656/package-info.nvim',
  --   requires = 'MunifTanjim/nui.nvim',
  -- })

  -- LSP
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('WhoIsSethDaniel/mason-tool-installer.nvim')
  use({
    'neovim/nvim-lspconfig',
    after = {
      'mason.nvim',
      'mason-lspconfig.nvim',
      'cmp-nvim-lsp',
      'neodev.nvim',
      'schemastore.nvim',
    },
  })
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  })
  use({
    'glepnir/lspsaga.nvim',
    after = 'nvim-lspconfig',
  })
  use('j-hui/fidget.nvim')

  -- Rust
  use({
    'simrat39/rust-tools.nvim',
    after = 'nvim-lspconfig',
  })

  -- completion and snippet
  use('rafamadriz/friendly-snippets')
  use('onsails/lspkind.nvim')
  use({
    'hrsh7th/nvim-cmp',
    after = { 'friendly-snippets', 'lspkind.nvim' },
  })
  use({
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
  })
  use({ 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' })
  use({ 'hrsh7th/cmp-nvim-lsp', after = 'cmp_luasnip' })
  use({ 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' })
  use({ 'hrsh7th/cmp-nvim-lua', after = 'cmp-buffer' })
  use({ 'hrsh7th/cmp-path', after = 'cmp-nvim-lua' })

  use({
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
  })
  use('windwp/nvim-ts-autotag')

  -- theme
  -- ['folke/tokyonight.nvim'] = {
  -- ['EdenEast/nightfox.nvim'] = {
  use({
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd('silent! colorscheme kanagawa')
    end,
  })

  use('kyazdani42/nvim-web-devicons')

  -- start page
  use('goolord/alpha-nvim')

  -- sidebar
  use('kyazdani42/nvim-tree.lua')

  -- status bar
  use('nvim-lualine/lualine.nvim')

  -- tab bar
  use({ 'akinsho/bufferline.nvim', tag = 'v2.*' })

  use('numToStr/Comment.nvim')

  -- finder
  use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })

  -- git
  use('lewis6991/gitsigns.nvim')

  -- key binding sheet
  use('folke/which-key.nvim')

  use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  })

  use('lukas-reineke/indent-blankline.nvim')

  use('norcalli/nvim-colorizer.lua')

  use({ 'akinsho/toggleterm.nvim', tag = 'v2.*' })

  use('keaising/im-select.nvim')
end)
