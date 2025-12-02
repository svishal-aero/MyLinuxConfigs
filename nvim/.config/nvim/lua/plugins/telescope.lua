return {
  {
    'nvim-telescope/telescope.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    config = function()

      local builtin = require('telescope.builtin')

      local Path = require('plenary.path')

      local function get_search_dir()
        local last_git_root = Path:new(vim.fn.getcwd()):absolute()
        local current_path = last_git_root
        while current_path~='/' do
          if Path:new(current_path .. '/.git'):exists() then
            last_git_root = current_path
          end
          current_path = Path:new(current_path):parent():absolute()
        end
        return last_git_root
      end

      local function custom_find_files()
        local search_dir = get_search_dir()
        local prompt_title = 'Searching in dir ' .. search_dir
        builtin.find_files({prompt_title=prompt_title, cwd=search_dir})
      end

      local function custom_live_grep()
        local search_dir = get_search_dir()
        local prompt_title = 'Searching in dir ' .. search_dir
        builtin.live_grep({prompt_title=prompt_title, cwd=search_dir})
      end

      local function custom_lsp_references()
        builtin.lsp_references({previewer=true})
      end

      -- These are the mappings that fire up telescope
      vim.keymap.set('n', '<Leader>fb', builtin.buffers,         {noremap = true})
      vim.keymap.set('n', '<Leader>ff', custom_find_files,       {noremap = true})
      vim.keymap.set('n', '<Leader>fg', custom_live_grep,        {noremap = true})
      vim.keymap.set('n', '<Leader>fh', builtin.help_tags,       {noremap = true})
      vim.keymap.set('n', '<Leader>fs', builtin.grep_string,     {noremap = true})
      vim.keymap.set('n', '<Leader>fd', builtin.diagnostics,     {noremap = true})
      vim.keymap.set('n', '<Leader>fr', builtin.oldfiles,        {noremap = true})
      vim.keymap.set('n', 'gr',         custom_lsp_references,   {noremap = true})
      vim.keymap.set('n', 'gd',         builtin.lsp_definitions, {noremap = true})

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
