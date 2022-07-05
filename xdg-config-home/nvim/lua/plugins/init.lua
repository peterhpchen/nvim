local present, packer = pcall(require, 'packer')

if not present then
  return
end

local plugins = {
  ['wbthomason/packer.nvim'] = {},

  ['nvim-treesitter/nvim-treesitter'] = {
    run = ':TSUpdate',
    config = function()
      require('plugins/configs/treesitter')
    end,
  },

  -- LSP
  ['b0o/schemastore.nvim'] = {},
  ['folke/lua-dev.nvim'] = {},
  ['williamboman/nvim-lsp-installer'] = {},
  ['neovim/nvim-lspconfig'] = {
    after = { 'nvim-lsp-installer', 'schemastore.nvim', 'lua-dev.nvim' },
    config = function()
      require('plugins/configs/lsp-installer')
      require('plugins/configs/lspconfig')
    end,
  },
  ['jose-elias-alvarez/null-ls.nvim'] = {
    config = function()
      require('plugins/configs/null-ls')
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  },
  ['glepnir/lspsaga.nvim'] = {
    after = 'nvim-lspconfig',
    branch = 'features', -- reset to main until merged
    config = function()
      require('plugins/configs/lspsaga')
    end,
  },

  -- completion and snippet
  ['rafamadriz/friendly-snippets'] = {},
  ['onsails/lspkind.nvim'] = {},
  ['hrsh7th/nvim-cmp'] = {
    after = { 'friendly-snippets', 'lspkind.nvim' },
    config = function()
      require('plugins/configs/cmp')
    end,
  },
  ['L3MON4D3/LuaSnip'] = { after = 'nvim-cmp' },
  ['saadparwaiz1/cmp_luasnip'] = { after = 'LuaSnip' },
  ['hrsh7th/cmp-nvim-lsp'] = { after = 'cmp_luasnip' },
  ['hrsh7th/cmp-buffer'] = { after = 'cmp-nvim-lsp' },
  ['hrsh7th/cmp-nvim-lua'] = { after = 'cmp-buffer' },
  ['hrsh7th/cmp-path'] = { after = 'cmp-nvim-lua' },

  ['windwp/nvim-autopairs'] = {
    after = 'nvim-cmp',
    config = function()
      require('plugins/configs/autopairs')
    end,
  },

  -- theme
  -- ['folke/tokyonight.nvim'] = {
  -- ['EdenEast/nightfox.nvim'] = {
  ['rebelot/kanagawa.nvim'] = {
    config = function()
      vim.cmd('silent! colorscheme kanagawa')
    end,
  },

  ['kyazdani42/nvim-web-devicons'] = {},

  -- start page
  ['goolord/alpha-nvim'] = {
    config = function()
      require('plugins/configs/alpha')
    end,
  },

  -- sidebar
  ['kyazdani42/nvim-tree.lua'] = {
    config = function()
      require('plugins/configs/nvim-tree')
    end,
  },

  -- status bar
  ['nvim-lualine/lualine.nvim'] = {
    config = function()
      require('plugins/configs/lualine')
    end,
  },

  -- tab bar
  ['akinsho/bufferline.nvim'] = {
    tag = 'v2.*',
    config = function()
      require('plugins/configs/bufferline')
    end,
  },

  ['numToStr/Comment.nvim'] = {
    config = function()
      require('plugins/configs/comment')
    end,
  },

  -- finder
  ['nvim-telescope/telescope.nvim'] = {
    config = function()
      require('plugins/configs/telescope')
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  },

  -- git
  ['lewis6991/gitsigns.nvim'] = {
    config = function()
      require('plugins/configs/gitsigns')
    end,
  },

  -- key binding sheet
  ['folke/which-key.nvim'] = {
    config = function()
      require('plugins/configs/which-key')
    end,
  },

  ['folke/trouble.nvim'] = {
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins/configs/trouble')
    end,
  },

  ['lukas-reineke/indent-blankline.nvim'] = {
    config = function()
      require('plugins/configs/indent-blankline')
    end,
  },

  ['norcalli/nvim-colorizer.lua'] = {
    config = function()
      require('plugins/configs/colorizer')
    end,
  },
}

packer.startup(function(use)
  local config = require('svim/core/default-config')
  for _, ext in pairs(config.extensions) do
    local ext_plugins = require(ext .. '/plugins')
    plugins = vim.tbl_deep_extend('force', plugins, ext_plugins)
  end

  local plugin_configs = {}
  for key, _ in pairs(plugins) do
    plugins[key][1] = key

    plugin_configs[#plugin_configs + 1] = plugins[key]
  end

  for _, v in pairs(plugin_configs) do
    use(v)
  end
end)
