local present, comment = pcall(require, 'Comment')

if not present then
  return
end

local ts_context_commentstring_ok, ts_context_commentstring =
    pcall(require, 'ts_context_commentstring.integrations.comment_nvim')

if not ts_context_commentstring_ok then
  return
end

comment.setup({
  pre_hook = ts_context_commentstring.create_pre_hook(),
})
