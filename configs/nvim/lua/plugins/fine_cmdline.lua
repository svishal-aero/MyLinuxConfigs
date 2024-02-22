return {
  'VonHeikemen/fine-cmdline.nvim',

  config = function()
    require('fine-cmdline').setup({
      hooks = {
        after_mount = function(input)
          vim.keymap.set('n', ':', '<Nop>', {buffer=input.bufnr})
          vim.keymap.set('n', 'q', '<cmd>q<CR>', {buffer=input.bufnr})
        end
      },
    })
    vim.o.cmdheight = 0
    vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', {noremap=true})
  end
}
