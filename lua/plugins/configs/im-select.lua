local present, im_select = pcall(require, 'im_select')

if not present then
  return
end

im_select.setup()
