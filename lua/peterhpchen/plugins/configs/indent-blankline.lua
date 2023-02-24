local present, indent_blankline = pcall(require, 'indent_blankline')

if not present then
  return
end

vim.opt.list = true
vim.opt.listchars:append('eol:↴')

indent_blankline.setup({
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
})
