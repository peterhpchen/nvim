local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then
  return
end

vim.cmd('packadd packer.nvim')

packer.startup(function(use)
  use('wbthomason/packer.nvim')

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.configs.treesitter')
    end,
  })
  use('JoosepAlviste/nvim-ts-context-commentstring')

  -- Lua
  use('folke/lua-dev.nvim')

  -- JSON
  use('b0o/schemastore.nvim')
  -- disable because bug issue https://github.com/vuki656/package-info.nvim/issues/127
  -- use({
  --   'vuki656/package-info.nvim',
  --   config = function()
  --     require('plugins.configs.package-info')
  --   end,
  --   requires = 'MunifTanjim/nui.nvim',
  -- })

  -- LSP
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use({
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('plugins.configs.mason-tool-installer')
    end,
  })
  use({
    'neovim/nvim-lspconfig',
    after = {
      'mason.nvim',
      'mason-lspconfig.nvim',
      'cmp-nvim-lsp',
      'lua-dev.nvim',
      'schemastore.nvim',
    },
    config = function()
      require('plugins.configs.mason')
      require('plugins.configs.mason-lspconfig')
      require('plugins.configs.lspconfig')
    end,
  })
  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('plugins.configs.null-ls')
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  })
  use({
    'glepnir/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('plugins.configs.lspsaga')
    end,
  })

  -- Rust
  use({
    'simrat39/rust-tools.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('plugins.configs.rust-tools')
    end,
  })

  -- completion and snippet
  use('rafamadriz/friendly-snippets')
  use('onsails/lspkind.nvim')
  use({
    'hrsh7th/nvim-cmp',
    after = { 'friendly-snippets', 'lspkind.nvim' },
    config = function()
      require('plugins.configs.cmp')
    end,
  })
  use({
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = function()
      require('plugins.configs.luasnip')
    end,
  })
  use({ 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' })
  use({ 'hrsh7th/cmp-nvim-lsp', after = 'cmp_luasnip' })
  use({ 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' })
  use({ 'hrsh7th/cmp-nvim-lua', after = 'cmp-buffer' })
  use({ 'hrsh7th/cmp-path', after = 'cmp-nvim-lua' })

  use({
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
      require('plugins.configs.autopairs')
    end,
  })
  use({
    'windwp/nvim-ts-autotag',
    config = function()
      require('plugins.configs.ts-autotag')
    end,
  })

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
  use({
    'goolord/alpha-nvim',
    config = function()
      require('plugins.configs.alpha')
    end,
  })

  -- sidebar
  use({
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('plugins.configs.nvim-tree')
    end,
  })

  -- status bar
  use({
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.configs.lualine')
    end,
  })

  -- tab bar
  use({
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    config = function()
      require('plugins.configs.bufferline')
    end,
  })

  use({
    'numToStr/Comment.nvim',
    config = function()
      require('plugins.configs.comment')
    end,
  })

  -- finder
  use({
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins.configs.telescope')
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  })

  -- git
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.configs.gitsigns')
    end,
  })

  -- key binding sheet
  use({
    'folke/which-key.nvim',
    config = function()
      require('plugins.configs.which-key')
    end,
  })

  use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.configs.trouble')
    end,
  })

  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.configs.indent-blankline')
    end,
  })

  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('plugins.configs.colorizer')
    end,
  })

  use({
    'akinsho/toggleterm.nvim',
    tag = 'v2.*',
    config = function()
      require('plugins.configs.toggleterm')
    end,
  })
end)
