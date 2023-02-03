local present, package_info = pcall(require, 'package-info')

if not present then
  return
end

package_info.setup()

vim.api.nvim_set_keymap(
  'n',
  '<leader>ns',
  "<cmd>lua require('package-info').show()<cr>",
  { silent = true, noremap = true }
)
