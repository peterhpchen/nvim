# Peter's Neovim

My personal Neovim configuration.

## Plugins

### Plugin Manager

- `folke/lazy.nvim`

### Package Manager

- `williamboman/mason.nvim`
  - `WhoIsSethDaniel/mason-tool-installer.nvim`
    - [Config][LSP]`williamboman/mason-lspconfig.nvim`

### Color Scheme

- (Default) `gbprod/nord.nvim`
- `EdenEast/nightfox.nvim`
- `folke/tokyonight.nvim`
- `rebelot/kanagawa.nvim`

### Treesitter

- `nvim-treesitter/nvim-treesitter`

  - [Config][`commentstring`] `JoosepAlviste/nvim-ts-context-commentstring`

### LSP

- `neovim/nvim-lspconfig`

  - [Config][Package Manager]`williamboman/mason-lspconfig.nvim`
  - [Source][`jsonls`] `b0o/schemastore.nvim`
  - [Config][`lua_ls`] `folke/neodev.nvim`
  - [Config][`efm`] `creativenull/efmls-configs-nvim`

- `nvimdev/lspsaga.nvim`
- `j-hui/fidget.nvim`

### Snippets

- `L3MON4D3/LuaSnip`

  - [Source] `rafamadriz/friendly-snippets`

### Auto Completion

- `hrsh7th/nvim-cmp`

  - [Source] `hrsh7th/cmp-nvim-lsp`
  - [Source] `saadparwaiz1/cmp_luasnip`
  - [Source] `hrsh7th/cmp-path`
  - [Source] `hrsh7th/cmp-buffer`
  - [Source] `folke/neodev.nvim`

### Coding

- `numToStr/Comment.nvim`

  - [Config][Treesitter] `JoosepAlviste/nvim-ts-context-commentstring`

- `windwp/nvim-autopairs`
- `windwp/nvim-ts-autotag`
- `github/copilot.vim`
- `metakirby5/codi.vim`

### Git

- `lewis6991/gitsigns.nvim`
- `tpope/vim-fugitive`

### Finder

- `nvim-telescope/telescope.nvim`
- `nvim-telescope/telescope-file-browser.nvim`

### UI

- `nvim-lualine/lualine.nvim`
- `nvim-colorizer.lua`
- `lukas-reineke/indent-blankline.nvim`

### Misc

- `nvim-lua/plenary.nvim`
- `nvim-tree/nvim-web-devicons`
- `keaising/im-select.nvim`
- `mbbill/undotree`
- `vimwiki/vimwiki`

## My LSP Settings

### .js, .jsx

- formatter: prettierd

### .ts, .tsx

- formatter: prettierd

### .md

- formatter: prettierd

### .lua

- formatter: stylua

### .sh

- linter: shellcheck
- formatter: shfmt

### Dockerfile

- linter: hadolint

### Python

- formatter: black, isort

## Try it in the docker container

I write a `Dockerfile` to build a docker image for this nvim config. You can try it by:

```sh
cd .scripts/docker
. ./run.sh
```

## Installation

Install this config by the below command:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/peterhpchen/nvim/main/.scripts/install.sh)"
```

## Uninstall

Just execute the following command:

```sh
rm -rf ~/.config/nvim \
~/.local/share/nvim \
~/.local/state/nvim \
~/.cache/nvim
```
