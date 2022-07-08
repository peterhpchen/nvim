local present1, null_ls = pcall(require, 'null-ls')

if not present1 then
  return
end

local present2, on_attach = pcall(require, 'svim/lsp/on_attach')

if not present2 then
  return
end

local utils = require('svim.core.utils')

local sources = {
  -- Dockerfile
  null_ls.builtins.diagnostics.hadolint,

  -- Shell
  null_ls.builtins.code_actions.shellcheck,
  null_ls.builtins.diagnostics.shellcheck,
  null_ls.builtins.formatting.shfmt,
}

local config = utils.load_config()
for _, ext in pairs(config.extensions) do
  local ext_sources_exists, ext_sources = pcall(require, ext .. '/plugins/configs/null-ls')
  if ext_sources_exists then
    for _, ext_source in pairs(ext_sources) do
      table.insert(sources, ext_source)
    end
  end
end

null_ls.setup({
  on_attach = on_attach,
  sources = sources,
})
