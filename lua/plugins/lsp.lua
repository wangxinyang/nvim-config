return  {
    {
		event = "VeryLazy",
		"neovim/nvim-lspconfig",
        dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            require("plugins.configs.lspconfig")
        end
	},
    {
		event = "VeryLazy",
		"williamboman/mason.nvim",
	},
    { 
        event = "VeryLazy",
        "williamboman/mason-lspconfig.nvim", 
    },
}