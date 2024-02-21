return {
  {
    'nvim-telescope/telescope.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    config = function()

      local builtin = require('telescope.builtin')

      -- These are the mappings that fire up telescope
      vim.keymap.set('n', '<Leader>ff', builtin.find_files,     {})
      vim.keymap.set('n', '<Leader>fg', builtin.live_grep,      {})
      vim.keymap.set('n', '<Leader>fd', builtin.diagnostics,    {})
      vim.keymap.set('n', '<Leader>fr', builtin.lsp_references, {})

    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        defaults = {

          -- These are the mappings that work when telescope is open
          mappings = {
            n = {['q'] = require('telescope.actions').close, },
          },

        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
