local present, mason_tool_installer = pcall(require, 'mason-tool-installer')

if not present then
  return
end

mason_tool_installer.setup({
  ensure_installed = {
    -- sh
    'shellcheck',
    'shfmt',

    -- dockerfile
    'hadolint',

    -- javascript
    'prettierd',
    'eslint_d',

    -- python
    'black',
    'isort',

    -- lua
    'stylua',
  },
})
