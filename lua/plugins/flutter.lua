return {
    {
        lazy = false,
        ft = "dart",
        "akinsho/flutter-tools.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        }, --[[ config = function()
            require("plugins.configs.flutter-config").setup()
        end ]]
        --[[ config = function()
            require('flutter-tools').setup {
                debugger = {
                    enabled = true,
                    run_via_dap = true,
                },
                outline = { auto_open = false },
                decorations = {
                    statusline = { device = true, app_version = true },
                },
                widget_guides = { enabled = true, debug = true },
                dev_log = { enabled = false, open_cmd = "tabedit" },
                lsp = {
                    color = {
                        enabled = true,
                        background = true,
                        virtual_text = false,
                    },
                    settings = {
                        showTodos = true,
                        renameFilesWithClasses = "prompt",
                    },
                    -- on_attach = require("plugins.configs.lspconfig").on_attach,
                    -- capabilities = require("plugins.configs.lspconfig").capabilities,
                    -- on_attach =
                    capabilities = function(config)
                        config = vim.lsp.protocol.make_client_capabilities()
                        config.textDocument.completion.completionItem.snippetSupport = true
                        require("cmp_nvim_lsp").default_capabilities(config)
                        return config
                    end,
                },
            }
        end, ]]
        opts = function()
            return require 'plugins.configs.flutter-config'
        end,
        config = function(_, opts)
            require("flutter-tools").setup(opts)
        end
    },
}
