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
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })()
    end,
    config = function()
      require('peterhpchen.plugins.configs.treesitter')
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('peterhpchen.plugins.configs.ts-context-commentstring')
    end,
  },

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
    'creativenull/efmls-configs-nvim',
    version = 'v1.x.x',
    dependencies = { 'neovim/nvim-lspconfig' },
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('peterhpchen.plugins.configs.lspsaga')
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      require('peterhpchen.plugins.configs.fidget')
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

  -- colorscheme
  {
    'EdenEast/nightfox.nvim',
    lazy = true,
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = { style = 'moon' },
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
  },

  'nvim-tree/nvim-web-devicons',

  -- status bar
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('peterhpchen.plugins.configs.lualine')
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
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
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
  'tpope/vim-fugitive',

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
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
    'keaising/im-select.nvim',
    config = function()
      require('peterhpchen.plugins.configs.im-select')
    end,
  },

  'mbbill/undotree',

  'github/copilot.vim',

  'metakirby5/codi.vim',

  {
    'vimwiki/vimwiki',
    init = function()
      require('peterhpchen.plugins.configs.vimwiki')
    end,
  },
})
