-- [[
return {
  {
    'williamboman/mason.nvim',

    lazy = false,

    config = function()

      require('mason').setup()

    end
  },
  {
    'williamboman/mason-lspconfig.nvim',

    lazy = false,

    config = function()

      require('mason-lspconfig').setup({

        ensure_installed = {
          'lua_ls',
          'clangd',
        }

      })

    end
  },
  {
    'neovim/nvim-lspconfig',

    lazy = false,

    config = function()

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })

      vim.api.nvim_create_autocmd('LspAttach', {

        group = vim.api.nvim_create_augroup('UserLspConfig', {}),

        callback = function(ev)

          local opts = { buffer = ev.buf }
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<Leader>o', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '<Leader>;', vim.diagnostic.goto_next, opts)
          vim.keymap.set('n', '<Leader>,', vim.diagnostic.goto_prev, opts)
          vim.keymap.set({'n', 'v'}, '<Leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

        end

      })

      vim.lsp.set_log_level('off')

    end
  },
}
-- ]]
