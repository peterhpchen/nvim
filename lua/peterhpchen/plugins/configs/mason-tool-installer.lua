local present, mason_tool_installer = pcall(require, 'mason-tool-installer')

if not present then
  return
end

mason_tool_installer.setup({
  ensure_installed = {
    -- vue
    'vue-language-server',
    -- typescript
    'typescript-language-server',
    -- css
    'tailwindcss-language-server',
    -- python
    'pyright',
    -- lua
    'lua-language-server',
    -- json
    'json-lsp',
    -- js, jsx, ts, tsx
    'eslint-lsp',
    -- dockerfile
    'dockerfile-language-server',
    -- bash
    'bash-language-server',
    -- astro
    'astro-language-server',

    -- sh
    'shellcheck',
    'shfmt',

    -- dockerfile
    'hadolint',

    -- javascript
    -- -- prettier is installed by homebrew
    -- 'prettier',
    -- -- don't use prettierd, it doesn't follow the configuration file location rules
    -- 'prettierd',
    -- 'eslint_d',

    -- python
    'black',
    'isort',

    -- lua
    'stylua',

    -- efm (general purpose language server)
    'efm',

    -- -- spell
    -- 'cspell',
  },
})
