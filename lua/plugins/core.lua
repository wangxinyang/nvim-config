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
        opts = function()
            return require 'plugins.configs.null-ls'
        end,
        config = function(_, opts)
            require("null-ls").setup(opts)
        end,
    },
    {
        event = "VeryLazy",
        "mfussenegger/nvim-dap",
        config = function ()
            require("plugins.configs.dap")
        end
    },
    {
        event = "VeryLazy",
        ft = "go",
        "leoluz/nvim-dap-go",
        dependencies = {"mfussenegger/nvim-dap"},
        config = function (_, opts)
            require("dap-go").setup(opts)
        end
    },
    {
        event = "VeryLazy",
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap"},
        config = function ()
            local dap = require("dap")
            local dapui = require("dapui")
            require("dapui").setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
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
    {
        event = "VeryLazy",
        "Exafunction/codeium.vim",
        config = function ()
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
            vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
}
