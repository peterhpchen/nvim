# Peter's Neovim

My personal Neovim configuration.

## Plugins

- `lazy.nvim`
- `nvim-treesitter`
- `nvim-ts-context-commentstring`
- `neodev.nvim`
- `schemastore.nvim`
- `mason.nvim`
- `mason-lspconfig.nvim`
- `plenary.nvim`
- `nvim-lspconfig`
- `cmp-nvim-lsp`
- `lspsaga.nvim`
- `fidget.nvim`
- `friendly-snippets`
- `nvim-cmp`
- `LuaSnip`
- `cmp_luasnip`
- `cmp-buffer`
- `cmp-nvim-lua`
- `cmp-path`
- `nvim-autopairs`
- `nvim-ts-autotag`
- `nightfox.nvim`
- `tokyonight.nvim`
- `kanagawa.nvim`
- `nvim-web-devicons`
- `lualine.nvim`
- `Comment.nvim`
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
- `efmls-configs-nvim`

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
