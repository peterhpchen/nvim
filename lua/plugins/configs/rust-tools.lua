local present, rust_tools = pcall(require, 'rust-tools')

if not present then
  return
end

rust_tools.setup({})
