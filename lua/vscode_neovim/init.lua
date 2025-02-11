-- options
vim.g.mapleader = ';' -- Default is '\'

vim.opt.clipboard = 'unnamed,unnamedplus'

vim.keymap.set("n", "<space>fb", function()
  require("vscode").action("workbench.view.explorer", { })
end, {})

vim.keymap.set("n", "<leader>fg", function()
  require("vscode").action("workbench.view.search", { })
end, {})

vim.keymap.set("n", "<leader>fb", function()
  require("vscode").action("workbench.action.showAllEditors", { })
end, {})