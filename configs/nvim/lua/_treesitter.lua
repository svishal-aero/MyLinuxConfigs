-- nvim-treesitter stuff
local configs = require'nvim-treesitter.configs'
configs.setup {
    ensure_installed = "all",
    auto_install = true,
    ignore_install = {"norg"},
    highlight = { -- enable highlighting
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = false, -- default is disabled anyways
    }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
