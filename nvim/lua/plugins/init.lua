local present, packer = pcall(require, 'packer')

if not present then
  return
end

packer.startup(function()
  use('wbthomason/packer.nvim')

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins/configs/treesitter')
    end,
  })

  -- LSP
  use('williamboman/nvim-lsp-installer')
  use({
    'neovim/nvim-lspconfig',
    after = 'nvim-lsp-installer',
    config = function()
      require('plugins/configs/lsp-installer')
      require('plugins/configs/lspconfig')
    end,
  })
  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('plugins/configs/null-ls')
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  })

  -- completion and snippet
  use('rafamadriz/friendly-snippets')
  use({
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    config = function()
      require('plugins/configs/cmp')
    end,
  })
  use({ 'L3MON4D3/LuaSnip', after = 'nvim-cmp' })
  use({ 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' })
  use({ 'hrsh7th/cmp-nvim-lsp', after = 'cmp_luasnip' })
  use({ 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' })
  use({ 'hrsh7th/cmp-nvim-lua', after = 'cmp-buffer' })
  use({ 'hrsh7th/cmp-path', after = 'cmp-nvim-lua' })

  -- theme
  use({
    'EdenEast/nightfox.nvim',
    config = function()
      vim.cmd('silent! colorscheme nordfox')
    end,
  })

  use('kyazdani42/nvim-web-devicons')

  -- sidebar
  use({
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('plugins/configs/nvim-tree')
    end,
  })

  -- status bar
  use({
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins/configs/lualine')
    end,
  })

  -- tab bar
  use({
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    config = function()
      require('plugins/configs/bufferline')
    end,
  })

  use({
    'numToStr/Comment.nvim',
    config = function()
      require('plugins/configs/comment')
    end,
  })

  -- finder
  use({
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins/configs/telescope')
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  })

  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins/configs/gitsigns')
    end,
  })
end)
