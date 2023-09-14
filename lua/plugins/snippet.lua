return {
	{ "michaelb/sniprun", event = "VeryLazy", build = "bash ./install.sh" },
	{
		"L3MON4D3/LuaSnip",
		commit = "79f647218847b1cd204fede7dd89025e43fd00c3",
		event = "InsertEnter",
		-- wants = "friendly-snippets",
		-- after = "nvim-cmp",
		config = function()
			--[[ local luasnip = require("luasnip")
			luasnip.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
			}) ]]
			-- Beside defining your own snippets you can also load snippets from "vscode-like" packages
			-- that expose snippets in json files, for example <https://github.com/rafamadriz/friendly-snippets>.

			-- require("luasnip.loaders.from_vscode").load({ include = { "python" } }) -- Load only python snippets

			-- The directories will have to be structured like eg. <https://github.com/rafamadriz/friendly-snippets> (include
			-- a similar `package.json`)
			-- require("luasnip.loaders.from_vscode").load({ paths = { "./config/nvim/other/friendly-snippets" } }) -- Load snippets from my-snippets folder

			-- You can also use lazy loading so snippets are loaded on-demand, not all at once (may interfere with lazy-loading luasnip itself).
			-- require("luasnip.loaders.from_vscode").lazy_load()
			-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/other/my-snippets" } })
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/other/friendly-snippets" } })
			--[[ require("luasnip.loaders.from_vscode").lazy_load({
				include = { "rust", "go",  "sh", "json", "lua", "gitcommit", "sql", "markdown" },
			}) ]]
			-- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/my_snippets/lua/" })
			-- require("go").setup({})
		end,
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
}
