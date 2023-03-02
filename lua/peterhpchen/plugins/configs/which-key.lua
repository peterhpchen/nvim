local present, wk = pcall(require, 'which-key')

if not present then
  return
end

wk.setup({})

local mappings_ok, core_mappings = pcall(require, 'peterhpchen.core.mappings')

if not mappings_ok then
  return
end

for mode, mode_values in pairs(core_mappings) do
  for keybind, mapping_settings in pairs(mode_values) do
    local mappings = { [keybind] = { mapping_settings[1], mapping_settings[2] } }
    local opts = vim.tbl_deep_extend('force', { mode = mode }, mapping_settings[3] or {})
    wk.register(mappings, opts)
  end
end
