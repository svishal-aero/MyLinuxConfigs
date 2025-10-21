return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,

  config = function()
    vim.keymap.set("n", "<Leader>e", function()
      require("oil").open_float(".")
    end, {})
  end
}
