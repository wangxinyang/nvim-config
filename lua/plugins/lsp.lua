return  {
    {
        "folke/neodev.nvim",
        event = "VeryLazy",
        config = function()
            require("neodev").setup({})
        end,
    },
    {
        event = "VeryLazy",
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "onsails/lspkind.nvim",
            "folke/neodev.nvim",
        },
        config = function()
            require("plugins.configs.lspconfig")
        end
    },
    --  暂时不使用eslint，使用biome
--[[     {
        event = "VeryLazy",
        "mfussenegger/nvim-lint",
        config = function()
            require("plugins.configs.lint")
        end
    }, ]]
    {
        event = "VeryLazy",
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "gopls",
                "rust_analyzer",
                -- "eslint-lsp",
                "typescript-language-server",
                "biome",
            },
        },
    },
    {
        event = "VeryLazy",
        "williamboman/mason-lspconfig.nvim",
    },
}
