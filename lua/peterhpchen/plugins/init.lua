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
      require('peterhpchen.plugins.configs.treesitter')
    end,
  })
  use('JoosepAlviste/nvim-ts-context-commentstring')

  -- Lua
  use('folke/neodev.nvim')

  -- JSON
  use('b0o/schemastore.nvim')
  -- disable because bug issue https://github.com/vuki656/package-info.nvim/issues/127
  -- use({
  --   'vuki656/package-info.nvim',
  --     config = function()
  --     require('peterhpchen.plugins.configs.package-info')
  --   end,
  --   requires = 'MunifTanjim/nui.nvim',
  -- })

  -- LSP
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use({
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('peterhpchen.plugins.configs.mason-tool-installer')
    end,
  })
  use({
    'neovim/nvim-lspconfig',
    after = {
      'mason.nvim',
      'mason-lspconfig.nvim',
      'cmp-nvim-lsp',
      'neodev.nvim',
      'schemastore.nvim',
    },
    config = function()
      require('peterhpchen.plugins.configs.mason')
      require('peterhpchen.plugins.configs.mason-lspconfig')
      require('peterhpchen.plugins.configs.lspconfig')
    end,
  })
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('peterhpchen.plugins.configs.null-ls')
    end,
  })
  use({
    'glepnir/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('peterhpchen.plugins.configs.lspsaga')
    end,
  })
  use({
    'j-hui/fidget.nvim',
    config = function()
      require('peterhpchen.plugins.configs.fidget')
    end,
  })

  -- Rust
  use({
    'simrat39/rust-tools.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('peterhpchen.plugins.configs.rust-tools')
    end,
  })

  -- completion and snippet
  use('rafamadriz/friendly-snippets')
  use('onsails/lspkind.nvim')
  use({
    'hrsh7th/nvim-cmp',
    after = { 'friendly-snippets', 'lspkind.nvim' },
    config = function()
      require('peterhpchen.plugins.configs.cmp')
    end,
  })
  use({
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = function()
      require('peterhpchen.plugins.configs.luasnip')
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
      require('peterhpchen.plugins.configs.autopairs')
    end,
  })
  use({
    'windwp/nvim-ts-autotag',
    config = function()
      require('peterhpchen.plugins.configs.ts-autotag')
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
      require('peterhpchen.plugins.configs.alpha')
    end,
  })

  -- sidebar
  use({
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('peterhpchen.plugins.configs.nvim-tree')
    end,
  })

  -- status bar
  use({
    'nvim-lualine/lualine.nvim',
    config = function()
      require('peterhpchen.plugins.configs.lualine')
    end,
  })

  -- tab bar
  use({
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    config = function()
      require('peterhpchen.plugins.configs.bufferline')
    end,
  })

  use({
    'numToStr/Comment.nvim',
    config = function()
      require('peterhpchen.plugins.configs.comment')
    end,
  })

  -- finder
  use({
    'nvim-telescope/telescope.nvim',
    config = function()
      require('peterhpchen.plugins.configs.telescope')
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  })

  -- git
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('peterhpchen.plugins.configs.gitsigns')
    end,
  })

  -- key binding sheet
  use({
    'folke/which-key.nvim',
    config = function()
      require('peterhpchen.plugins.configs.which-key')
    end,
  })

  use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('peterhpchen.plugins.configs.trouble')
    end,
  })

  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('peterhpchen.plugins.configs.indent-blankline')
    end,
  })

  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('peterhpchen.plugins.configs.colorizer')
    end,
  })

  use({
    'akinsho/toggleterm.nvim',
    tag = 'v2.*',
    config = function()
      require('peterhpchen.plugins.configs.toggleterm')
    end,
  })

  use({
    'keaising/im-select.nvim',
    config = function()
      require('peterhpchen.plugins.configs.im-select')
    end,
  })
end)
