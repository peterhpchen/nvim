local present1, packer = pcall(require, 'packer')

if not present1 then
  return
end

local present2, plugins = pcall(require, 'svim/plugins')

if not present2 then
  return
end

packer.startup(function(use)
  local config = require('svim/core/default-config')
  for _, ext in pairs(config.extensions) do
    local ext_plugins_exists, ext_plugins = pcall(require, ext .. '/plugins')
    if ext_plugins_exists then
      plugins = vim.tbl_deep_extend('force', plugins, ext_plugins)
    end
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
