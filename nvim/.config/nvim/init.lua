vim.o.winborder      = "rounded"
vim.o.expandtab      = true
vim.o.softtabstop    = 2
vim.o.tabstop        = 2
vim.o.shiftwidth     = 2
vim.o.number         = true
vim.o.relativenumber = true
vim.o.wrap           = false
vim.g.mapleader      = ' '

-- Alias for the Escape key
vim.keymap.set('i', 'jk', '<Esc>',  {noremap=true})

-- Code folding
--vim.opt.foldmethod  = "expr"
vim.o.foldmethod  = "manual"
vim.o.foldexpr    = "nvim_treesitter#foldexpr()"
vim.o.cursorline  = true

-- Other settings
vim.o.mouse = ""

require('statusline')

-- This block downloads the lazy package manager if not already installed and sets the path so that nvim knows where to find it
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
            vim.api.nvim_exec2("normal! g'\"", { output = false })
        end
    end
})

-- This completes the installation of any packages that are requested from the lazy package manager
require('lazy').setup('plugins')
require('oil').setup()

local deleteBufAndGoToPrevBufIfExists = function()
  local curr = vim.api.nvim_get_current_buf()
  if vim.bo[curr].modified then
    vim.api.nvim_echo({{'Buffer not deleted: unsaved changes!', 'WarningMsg'}}, false, {})
    return
  end
  local unpack = table.unpack or unpack
  local jumplist, jidx = unpack(vim.fn.getjumplist())
  local log = ''
  local target_buf = nil
  for i=jidx, 1, -1 do
    local jump = jumplist[i]
    local condition = jump and jump.bufnr and jump.bufnr~=curr
    condition = condition and vim.api.nvim_buf_is_valid(jump.bufnr)
    condition = condition and vim.api.nvim_buf_is_loaded(jump.bufnr)
    log = log .. '\nJumping to buffer ' .. vim.api.nvim_buf_get_name(jump.bufnr)
    if condition then
      target_buf = jump.bufnr
      break
    end
  end
  --vim.api.nvim_echo({{log, 'WarningMsg'}}, false, {})
  if target_buf then
    vim.api.nvim_set_current_buf(target_buf)
  else
    local scratch = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_current_buf(scratch)
  end
  if vim.api.nvim_buf_is_valid(curr) then
    vim.api.nvim_buf_delete(curr, { force = false })
  end
end

-- Navigation between vim panes
vim.keymap.set('n', '<C-h>'     , '<C-w>h'                       , {noremap=true})
vim.keymap.set('n', '<C-j>'     , '<C-w>j'                       , {noremap=true})
vim.keymap.set('n', '<C-k>'     , '<C-w>k'                       , {noremap=true})
vim.keymap.set('n', '<C-l>'     , '<C-w>l'                       , {noremap=true})
vim.keymap.set('n', '<leader>h' , '<cmd>noh<CR>'                 , {noremap=true})
vim.keymap.set('n', '<leader>bd', deleteBufAndGoToPrevBufIfExists, {noremap=true})
