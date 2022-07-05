return {
  ['simrat39/rust-tools.nvim'] = {
    after = 'nvim-lspconfig',
    config = function()
      require('dpkg-rs/plugins/configs/rust-tools')
    end,
  },
}
