return {
    {
      'folke/tokyonight.nvim',
      name = "tokyonight",
      lazy = false,
      event = "VeryLazy",
      priority = 1000,
      config = function()
        vim.cmd([[colorscheme tokyonight-moon]])
      end,
    },
  }