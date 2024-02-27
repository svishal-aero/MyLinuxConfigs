return {
  {
    'nvim-telescope/telescope.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    config = function()

      local builtin = require('telescope.builtin')

      -- These are the mappings that fire up telescope
      vim.keymap.set('n', '<Leader>fb', builtin.buffers,         {noremap = true})
      vim.keymap.set('n', '<Leader>ff', builtin.find_files,      {noremap = true})
      vim.keymap.set('n', '<Leader>fg', builtin.live_grep,       {noremap = true})
      vim.keymap.set('n', '<Leader>fh', builtin.help_tags,       {noremap = true})
      vim.keymap.set('n', '<Leader>fs', builtin.grep_string,     {noremap = true})
      vim.keymap.set('n', '<Leader>fd', builtin.diagnostics,     {noremap = true})
      vim.keymap.set('n', '<Leader>gr', builtin.lsp_references,  {noremap = true})
      vim.keymap.set('n', '<Leader>gd', builtin.lsp_definitions, {noremap = true})

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
