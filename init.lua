if vim.g.vscode then
  -- VSCode extension
  require('vscode_neovim')
elseif vim.g.config_name == 'simple' then
  require('simple')
else
  -- ordinary Neovim
  require('peterhpchen')
end
