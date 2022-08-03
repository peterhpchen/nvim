local present, mason_tool_installer = pcall(require, 'mason-tool-installer')

if not present then
  return
end

mason_tool_installer.setup({
  ensure_installed = {
    -- sh
    'bash-language-server',
    'shellcheck',
    'shfmt',

    -- dockerfile
    'dockerfile-language-server',
    'hadolint',

    -- javascript
    'eslint-lsp',
    'vue-language-server',
    'prettierd',
    'eslint_d',

    -- json
    'json-lsp',

    -- python
    'pyright',
    'black',
    'isort',

    -- lua
    'lua-language-server',
    'stylua',
  },
})
