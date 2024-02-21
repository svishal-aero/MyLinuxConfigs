return {
  'nvim-neo-tree/neo-tree.nvim',

  opts = {
    filesystem = {
      hijack_netrw_behavior = 'open_current'
    }
  },

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },

  config = function()

    require('neo-tree').setup({

      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,

    })

    vim.keymap.set('n', '<Leader>e', ':Neotree filesystem reveal left<CR>', {silent=true})

  end
}
