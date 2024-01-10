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
  -- colorscheme
  {
    'gbprod/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nord').setup({})
      vim.cmd.colorscheme('nord')
    end,
  },
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
  -- colorscheme

  -- treesitter
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
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('peterhpchen.plugins.configs.ts-context-commentstring')
    end,
  },
  -- treesitter

  -- LSP
  -- -- JSON
  -- disable because bug issue https://github.com/vuki656/package-info.nvim/issues/127
  -- {
  --   'vuki656/package-info.nvim',
  --     config = function()
  --     require('peterhpchen.plugins.configs.package-info')
  --   end,
  --   dependencies = 'MunifTanjim/nui.nvim',
  -- }

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
      {
        'folke/neodev.nvim',
        dependencies = {
          'hrsh7th/nvim-cmp',
        },
      },
      'b0o/schemastore.nvim',
      {
        'creativenull/efmls-configs-nvim',
        version = 'v1.x.x',
      },
    },
    config = function()
      require('peterhpchen.plugins.configs.mason')
      require('peterhpchen.plugins.configs.mason-lspconfig')
      require('peterhpchen.plugins.configs.lspconfig')
    end,
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
  -- LSP

  -- snippets
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',

    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('peterhpchen.plugins.configs.luasnip')
    end,
  },

  -- auto completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    },
    config = function()
      require('peterhpchen.plugins.configs.cmp')
    end,
  },

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

  -- comment
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('peterhpchen.plugins.configs.comment')
    end,
  },
  -- comment

  'nvim-tree/nvim-web-devicons',

  -- status bar
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('peterhpchen.plugins.configs.lualine')
    end,
  },

  -- finder
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
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
