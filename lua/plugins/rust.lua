return {
    {
      event = "VeryLazy",
      "rust-lang/rust.vim",
      ft = "rust",
      init = function ()
          vim.g.rustfmt_autosave = 1
      end
    },
    {
      event = "VeryLazy",
      "simrat39/rust-tools.nvim",
      ft = "rust",
      dependencies = "neovim/nvim-lspconfig",
      opts = function()
        return require 'plugins.configs.rust-tools'
      end,
      config = function (_, opts)
        require("rust-tools").setup(opts)
      end
    },
    {
      event = "VeryLazy",
      "mfussenegger/nvim-dap"
    },
    {
      "Saecki/crates.nvim",
      event = "VeryLazy",
      ft = {"rust", "toml"},
      config = function (_, opts)
        local crates = require("crates")
        crates.setup(opts)
        crates.show()
      end,
    },
}