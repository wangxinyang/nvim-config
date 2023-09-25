local M = {}

-- set up lspconfig
require("mason").setup({
	ui = {
		icons = {
			package_installed = "√",
			package_pending = "→",
			package_uninstalled = "×",
		},
	},
})

M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
end

-- M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
	  properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	  },
	},
  }

require("lspconfig").lua_ls.setup(
	{
		capabilities = M.capabilities,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim", "hs" },
				},
				workspace = {
					checkThirdParty = false,
					-- Make the server aware of Neovim runtime files
					library = {
						vim.api.nvim_get_runtime_file("", true),
						"/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/",
						vim.fn.expand("~/lualib/share/lua/5.4"),
						vim.fn.expand("~/lualib/lib/luarocks/rocks-5.4"),
						"/opt/homebrew/opt/openresty/lualib",
					},
				},
				completion = {
					callSnippet = "Replace",
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	}
)

return M
