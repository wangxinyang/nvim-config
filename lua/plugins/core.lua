return {
  {
    event = "VeryLazy",
    "jcdickinson/wpm.nvim",
    config = function()
        require("wpm").setup({})
    end
  },
	{
		event = "VeryLazy",
		"moll/vim-bbye",
	},
  -- auto-session
  -- "rmagatti/auto-session",
  {
    event = "VeryLazy",
    "akinsho/bufferline.nvim",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                -- 显示id
                number = "buffer_id | ordinal",
						    buffer_close_icon = '󰅖',
                modified_icon = '●',
					      show_buffer_icons = true,
                always_show_bufferline = true,
            }
        })
    end,
		dependencies = {
			"moll/vim-bbye",
		}
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
