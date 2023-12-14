local present, indent_blankline = pcall(require, 'ibl')

if not present then
  return
end

vim.opt.list = true
vim.opt.listchars:append('eol:↴')

indent_blankline.setup({
  scope = {
    show_end = true,
    show_start = true,
    enabled = true,
  },
})
