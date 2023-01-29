local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm( { select = true } ),
    ['<C-space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = { },
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)

    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>o', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<leader>;', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '<leader>,', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)

end)

lsp.setup()

local lsp_signature = require "lsp_signature"
lsp_signature.setup {
  bind = true,
  handler_opts = {
    border = "rounded",
  },
}

---- Archived setup ----------------------------------------------------------------------------------------
---- Setup lspconfig.
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
---- Add lsp servers to this list
--require('lspconfig')['fortls'].setup { capabilities = capabilities }
--require('lspconfig')['pyright'].setup { capabilities = capabilities }
--require('lspconfig')['clangd' ].setup { capabilities = capabilities, filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" } }
--require('lspconfig')['texlab' ].setup { capabilities = capabilities, filetypes = { "tex", "bib", "plaintex" } }
--require('lspconfig')['cmake'  ].setup { capabilities = capabilities }
