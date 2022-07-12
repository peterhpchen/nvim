local present, packer = pcall(require, 'packer')

if not present then
  return
end

packer.startup(function(use)
  use('wbthomason/packer.nvim')

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('svim/plugins/configs/treesitter')
    end,
  })

  -- Lua
  use('folke/lua-dev.nvim')

  -- JSON
  use('b0o/schemastore.nvim')

  -- LSP
  use('williamboman/nvim-lsp-installer')
  use({
    'neovim/nvim-lspconfig',
    after = { 'nvim-lsp-installer', 'cmp-nvim-lsp', 'lua-dev.nvim', 'schemastore.nvim' },
    config = function()
      require('svim/plugins/configs/lsp-installer')
      require('svim/plugins/configs/lspconfig')
    end,
  })
  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('svim/plugins/configs/null-ls')
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  })
  use({
    'glepnir/lspsaga.nvim',
    after = 'nvim-lspconfig',
    branch = 'features', -- reset to main until merged
    config = function()
      require('svim/plugins/configs/lspsaga')
    end,
  })

  -- completion and snippet
  use('rafamadriz/friendly-snippets')
  use('onsails/lspkind.nvim')
  use({
    'hrsh7th/nvim-cmp',
    after = { 'friendly-snippets', 'lspkind.nvim' },
    config = function()
      require('svim/plugins/configs/cmp')
    end,
  })
  use({ 'L3MON4D3/LuaSnip', after = 'nvim-cmp' })
  use({ 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' })
  use({ 'hrsh7th/cmp-nvim-lsp', after = 'cmp_luasnip' })
  use({ 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' })
  use({ 'hrsh7th/cmp-nvim-lua', after = 'cmp-buffer' })
  use({ 'hrsh7th/cmp-path', after = 'cmp-nvim-lua' })

  use({
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
      require('svim/plugins/configs/autopairs')
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
      require('svim/plugins/configs/alpha')
    end,
  })

  -- sidebar
  use({
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('svim/plugins/configs/nvim-tree')
    end,
  })

  -- status bar
  use({
    'nvim-lualine/lualine.nvim',
    config = function()
      require('svim/plugins/configs/lualine')
    end,
  })

  -- tab bar
  use({
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    config = function()
      require('svim/plugins/configs/bufferline')
    end,
  })

  use({
    'numToStr/Comment.nvim',
    config = function()
      require('svim/plugins/configs/comment')
    end,
  })

  -- finder
  use({
    'nvim-telescope/telescope.nvim',
    config = function()
      require('svim/plugins/configs/telescope')
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  })

  -- git
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('svim/plugins/configs/gitsigns')
    end,
  })

  -- key binding sheet
  use({
    'folke/which-key.nvim',
    config = function()
      require('svim/plugins/configs/which-key')
    end,
  })

  use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('svim/plugins/configs/trouble')
    end,
  })

  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('svim/plugins/configs/indent-blankline')
    end,
  })

  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('svim/plugins/configs/colorizer')
    end,
  })
end)
