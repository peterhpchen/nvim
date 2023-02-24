local present1, cmp = pcall(require, 'cmp')

if not present1 then
  return
end

local present2, lspkind = pcall(require, 'lspkind')

if not present2 then
  return
end

vim.opt.completeopt = 'menu,menuone,noselect'

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
    }),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'path' },
  },
})
