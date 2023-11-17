return {
    {
        event = "VeryLazy",
        "akinsho/flutter-tools.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        opts = function()
            return require 'plugins.configs.flutter-config'
        end,
        config = function(_, opts)
            require("flutter-tools").setup(opts)
        end
    },
}
