local present, colorizer = pcall(require, 'colorizer')

if not present then
  return
end

vim.opt.termguicolors = true

colorizer.setup()
