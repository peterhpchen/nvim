local present1, autotag = pcall(require, 'nvim-autotag')

if not present1 then
  return
end

autotag.setup({})
