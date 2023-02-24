vim.api.nvim_create_autocmd({ 'BufRead', 'BufEnter' }, { pattern = '*.astro', command = 'set filetype=astro' })
