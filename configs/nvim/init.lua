-- Some basic editing settings
vim.o.expandtab       = true
-- vim.o.smartindent     = true
vim.o.tabstop         = 2
vim.o.shiftwidth      = 2
vim.wo.number         = true
vim.wo.relativenumber = true
vim.g.mapleader       = ' '

-- Alias for the Escape key
vim.keymap.set('i', 'jk',    '<Esc>',  {noremap=true})

-- Navigation between vim panes
vim.keymap.set('n', '<C-h>'    , '<C-w>h'      , {noremap=true})
vim.keymap.set('n', '<C-j>'    , '<C-w>j'      , {noremap=true})
vim.keymap.set('n', '<C-k>'    , '<C-w>k'      , {noremap=true})
vim.keymap.set('n', '<C-l>'    , '<C-w>l'      , {noremap=true})
vim.keymap.set('n', '<leader>h', '<cmd>noh<CR>', {noremap=true})

-- Code folding
vim.opt.foldmethod  = "expr"
vim.opt.foldexpr    = "nvim_treesitter#foldexpr()"
vim.opt.cursorline  = true

-- Other settings
--vim.opt.colorcolumn = "80"
vim.opt.mouse = ""

require('statusline')

-- This block downloads the lazy package manager if not already installed and sets the path so that nvim knows where to find it
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- This opens the file at the last accessed position (line/column)
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {"*"},
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"",false)
        end
    end
})

-- This completes the installation of any packages that are requested from the lazy package manager
require('lazy').setup('plugins')
