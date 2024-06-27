return {
  'nvim-treesitter/nvim-treesitter',

  build = ':TSUpdate',

  config = function()

    local configs = require('nvim-treesitter.configs')

    configs.setup({

      ensure_installed = {
        'lua',
        'cpp',
        'javascript',
      },

      highlight = {
        enable = true,
      },

      --indent = {
      --  enable = true,
      --},

    })

    vim.opt.autoindent=true
    vim.opt.smartindent=true

  end
}
