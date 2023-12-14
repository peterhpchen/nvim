local present, ts_context_commentstring = pcall(require, 'ts_context_commentstring')

if not present then
  return
end

ts_context_commentstring.setup({
  enable_autocmd = false,
})
