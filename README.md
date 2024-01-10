# Peter's Neovim

My personal Neovim configuration.

## Plugins

### Plugin Manager

- `folke/lazy.nvim`

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

  - [Source][`jsonls`] `b0o/schemastore.nvim`
  - [Config][`lua_ls`] `folke/neodev.nvim`
  - [Config][`efm`] `creativenull/efmls-configs-nvim`

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

### Comment

- `numToStr/Comment.nvim`

  - [Config][Treesitter] `JoosepAlviste/nvim-ts-context-commentstring`

- `mason.nvim`
- `mason-lspconfig.nvim`
- `plenary.nvim`
- `lspsaga.nvim`
- `fidget.nvim`
- `nvim-autopairs`
- `nvim-ts-autotag`
- `nvim-web-devicons`
- `lualine.nvim`
- `telescope-file-browser.nvim`
- `gitsigns.nvim`
- `vim-fugitive`
- `indent-blankline.nvim`
- `nvim-colorizer.lua`
- `im-select.nvim`
- `undotree`
- `copilot.vim`
- `codi.vim`
- `vimwiki`

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
