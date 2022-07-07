local M = {}

M.load_config = function()
  local config = require('svim/core/default-config')
  local sunnyrc_exists, sunnyrc = pcall(require, 'custom.sunnyrc')
  if sunnyrc_exists then
    if type(sunnyrc) == 'table' then
      config = vim.tbl_deep_extend('force', config, sunnyrc)
    end
  end

  return config
end

return M
