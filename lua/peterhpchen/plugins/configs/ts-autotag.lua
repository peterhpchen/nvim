local autotag_ok, autotag = pcall(require, 'nvim-autotag')

if not autotag_ok then
  return
end

autotag.setup()
