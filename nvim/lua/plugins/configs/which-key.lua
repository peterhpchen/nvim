local present, wk = pcall(require, 'which-key')

if not present then
  return
end

wk.setup({})
