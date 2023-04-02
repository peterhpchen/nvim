local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'nvim-treesitter/nvim-treesitter',
    version = false, -- last release is way too old and doesn't work on Windows
    build = ':TSUpdate',
    config = function()
      require('peterhpchen.plugins.configs.treesitter')
    end,
  },
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- Lua
  'folke/neodev.nvim',

  -- JSON
  'b0o/schemastore.nvim',
  -- disable because bug issue https://github.com/vuki656/package-info.nvim/issues/127
  -- {
  --   'vuki656/package-info.nvim',
  --     config = function()
  --     require('peterhpchen.plugins.configs.package-info')
  --   end,
  --   dependencies = 'MunifTanjim/nui.nvim',
  -- }

  -- LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('peterhpchen.plugins.configs.mason-tool-installer')
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
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
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('peterhpchen.plugins.configs.null-ls')
    end,
  },
  {
    'glepnir/lspsaga.nvim',
    dependencies = 'nvim-lspconfig',
    config = function()
      require('peterhpchen.plugins.configs.lspsaga')
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      require('peterhpchen.plugins.configs.fidget')
    end,
  },

  -- Rust
  {
    'simrat39/rust-tools.nvim',
    dependencies = 'nvim-lspconfig',
    config = function()
      require('peterhpchen.plugins.configs.rust-tools')
    end,
  },

  -- completion and snippet
  'rafamadriz/friendly-snippets',
  'onsails/lspkind.nvim',
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'friendly-snippets', 'lspkind.nvim' },
    config = function()
      require('peterhpchen.plugins.configs.cmp')
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = 'nvim-cmp',
    config = function()
      require('peterhpchen.plugins.configs.luasnip')
    end,
  },
  { 'saadparwaiz1/cmp_luasnip', dependencies = 'LuaSnip' },
  { 'hrsh7th/cmp-nvim-lsp', after = 'cmp_luasnip' },
  { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua', after = 'cmp-buffer' },
  { 'hrsh7th/cmp-path', after = 'cmp-nvim-lua' },

  {
    'windwp/nvim-autopairs',
    dependencies = 'nvim-cmp',
    config = function()
      require('peterhpchen.plugins.configs.autopairs')
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('peterhpchen.plugins.configs.ts-autotag')
    end,
  },

  -- theme
  -- 'folke/tokyonight.nvim'
  -- 'EdenEast/nightfox.nvim'
  {
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd('silent! colorscheme kanagawa')
    end,
  },

  'kyazdani42/nvim-web-devicons',

  -- start page
  {
    'goolord/alpha-nvim',
    config = function()
      require('peterhpchen.plugins.configs.alpha')
    end,
  },

  -- sidebar
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('peterhpchen.plugins.configs.nvim-tree')
    end,
  },

  -- status bar
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('peterhpchen.plugins.configs.lualine')
    end,
  },

  -- tab bar
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('peterhpchen.plugins.configs.bufferline')
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('peterhpchen.plugins.configs.comment')
    end,
  },

  -- finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('peterhpchen.plugins.configs.telescope')
    end,
  },

  -- git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('peterhpchen.plugins.configs.gitsigns')
    end,
  },

  -- key binding sheet
  {
    'folke/which-key.nvim',
    config = function()
      require('peterhpchen.plugins.configs.which-key')
    end,
  },

  {
    'folke/trouble.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('peterhpchen.plugins.configs.trouble')
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('peterhpchen.plugins.configs.indent-blankline')
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('peterhpchen.plugins.configs.colorizer')
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('peterhpchen.plugins.configs.toggleterm')
    end,
  },

  {
    'keaising/im-select.nvim',
    config = function()
      require('peterhpchen.plugins.configs.im-select')
    end,
  },

  {
    'mbbill/undotree',
    config = function()
      require('peterhpchen.plugins.configs.undotree')
    end,
  },

  'github/copilot.vim',
})
