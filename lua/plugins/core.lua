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
	{
		event = "InsertEnter",
		"folke/todo-comments.nvim",
  	dependencies = { "nvim-lua/plenary.nvim" },
  	opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  	}
  },
	{
		event = "VeryLazy",
 		"folke/trouble.nvim",
 		dependencies = { "nvim-tree/nvim-web-devicons" },
 		opts = {
  		-- your configuration comes here
  		-- or leave it empty to use the default settings
  		-- refer to the configuration section below
 		}
	},
	{
		event = "VeryLazy",
 		"preservim/tagbar"
	},
	{
    event = "VeryLazy",
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("indent_blankline").setup({
					show_end_of_line = true,
			    space_char_blankline = " ",
				})
    end
  },
	{
		event = "VeryLazy",
		"numToStr/Comment.nvim",
  	opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
			toggler = {
        ---Line-comment toggle keymap
        line = 'lc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
  	}
  },
}
