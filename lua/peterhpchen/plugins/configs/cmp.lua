local present, cmp = pcall(require, 'cmp')

if not present then
  return
end

vim.opt.completeopt = 'menu,menuone,noselect'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-s>'] = cmp.mapping.complete(), -- open snippet drop down list

    ['<C-n>'] = cmp.mapping.select_next_item(), -- same with telescope
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- same with telescope
    ['<C-u>'] = cmp.mapping.scroll_docs(4), -- same with telescope
    ['<C-d>'] = cmp.mapping.scroll_docs(-4), -- same with telescope
    ['<C-c>'] = cmp.mapping.close(), -- same with telescope
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- same with telescope
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    -- fallback
    { name = 'buffer' },
  }),
})
