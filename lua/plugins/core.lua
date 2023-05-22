return {
  {
    event = "VeryLazy",
    "jcdickinson/wpm.nvim",
    config = function()
        require("wpm").setup({})
    end
  },
  -- auto-session
  -- "rmagatti/auto-session",
  {
    event = "VeryLazy",
    "akinsho/bufferline.nvim",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffer",
                -- 显示id
                number = "ordinal"
            }
        })
    end
  },
  {
    event = "VeryLazy",
    "folke/persistence.nvim",
  },
  {
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
  { "onsails/lspkind.nvim", event = "VeryLazy" },
  {
    "jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		config = function()
			local null_ls = require("null-ls")
      null_ls.setup({
          sources = {
              null_ls.builtins.formatting.stylua,
              null_ls.builtins.diagnostics.eslint,
              null_ls.builtins.completion.spell,
          },
      })
		end,
  },
}