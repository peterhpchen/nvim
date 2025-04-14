local vscode_ok, vscode = pcall(require, 'vscode')

if not vscode_ok then
  return
end

require('simple')

vim.keymap.set('n', '<leader>xa', function()
  vscode.action('workbench.action.closeOtherEditors', {})
end, { desc = 'close buffer except current'})

vim.keymap.set('n', '<leader>x', function()
  vscode.action('workbench.action.closeActiveEditor', {})
end, { desc = 'close buffer'})

-- telescope.nvim
-- telescope-file-browser.nvim
vim.keymap.set('n', '<space>fb', function()
  vscode.action('workbench.view.explorer', { })
end, { desc = 'Telescope file_browser'})

vim.keymap.set('n', '<leader>fg', function()
  vscode.action('workbench.view.search', { })
end, { desc = 'Telescope live_grep' })

vim.keymap.set('n', '<leader>fb', function()
  vscode.action('workbench.action.showAllEditors', { })
end, { desc = 'Telescope buffers'})

-- lspsaga.nvim
vim.keymap.set('n', 'gh', function()
  vscode.action('editor.action.goToReferences', { })
end, { desc = 'Lspsaga finder'})

vim.keymap.set('n', 'gd', function()
  vscode.action('editor.action.revealDefinition', { })
end, { desc = 'Lspsaga goto_definition'})

vim.keymap.set({'n', 'v'}, '<leader>ca', function()
  vscode.action('editor.action.quickFix', { })
end, { desc = 'Lspsaga code_action'})

vim.keymap.set('n', 'gr', function()
  vscode.action('editor.action.rename', { })
end, { desc = 'Lspsaga rename'})

vim.keymap.set('n', '[e', function()
  vscode.action('editor.action.marker.prev', { })
  vscode.action('closeMarkersNavigation', { })
  vscode.action('editor.action.showHover', { })
end, { desc = 'Lspsaga diagnostic_jump_prev(partial support)'})

vim.keymap.set('n', ']e', function()
  vscode.action('editor.action.marker.next', { })
  vscode.action('closeMarkersNavigation', { })
  vscode.action('editor.action.showHover', { })
end, { desc = 'Lspsaga diagnostic_jump_next(partial support)'})

vim.keymap.set('n', '<C-[>', function()
  vscode.action('closeMarkersNavigation', { })
end, { desc = 'Close marker'})