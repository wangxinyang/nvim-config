local M = {}

-- Setup language servers.
local lspconfig = require('lspconfig')

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

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"gopls",
		"rust_analyzer",
		"sqlls",
		"html",
	},
})

-- 配置获得焦点时高亮，但是不成功
require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function (server_name) -- default handler (optional)
	--[[ 	local opts = {}
		opts.on_attach = function(client, bufnr)
			if client.server_capabilities.documentHighlightProvider then
				vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
				vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
				vim.api.nvim_create_autocmd("CursorHold", {
					callback = vim.lsp.buf.document_highlight,
					buffer = bufnr,
					group = "lsp_document_highlight",
					desc = "Document Highlight",
				})
				vim.api.nvim_create_autocmd("CursorMoved", {
					callback = vim.lsp.buf.clear_references,
					buffer = bufnr,
					group = "lsp_document_highlight",
					desc = "Clear All the References",
				})
			end
		end ]]
		--[[ 	local opts = {
			on_attach = function(client, bufnr)
				highlight_variable(client, bufnr)
			end,
		} ]]
		require("lspconfig")[server_name].setup{}
	end,
	-- Next, you can provide targeted overrides for specific servers.
})

-- 使用neovim原生lspconfig进行language server配置
local servers = {
	-- bashls = require("lsp.config.bash"),
	-- pyright = require("lsp.config.pyright"),
	-- tsserver = require("lsp.config.tsserver"),
	-- gopls = require("lsp.config.gopls"),
	-- clangd = require("lsp.config.clangd"),
	-- quick_lint_js = require("lsp.config.quick-lint-js"),
	sqlls = require("plugins.configs.lsp.config.sqlls"),
	-- css html
	-- emmet_ls = require("lsp.config.emmet-ls"),
	html = require("plugins.configs.lsp.config.html"),
	-- cssls = require("lsp.config.css"),
	-- json
	-- jsonls = require("lsp.config.json"),
	-- vim
	-- vimls = require("lsp.config.vimls"),
}
for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[name])
	else
		-- 使用默认参数
		lspconfig[name].setup({})
	end
end

M.on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	-- Hover actions
	vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
	-- Code action groups
	vim.keymap.set("n", "<Leader>a", require("rust-tools").code_action_group.code_action_group, { buffer = bufnr })
	if client.server_capabilities.documentHighlightProvider then
		vim.cmd [[
		  set updatetime=400
			hi! LspReferenceRead cterm=bold ctermfg=159 ctermbg=236 guibg=#FFAF5F
			hi! LspReferenceText cterm=bold ctermfg=159 ctermbg=236 guibg=#FFAF5F
			hi! LspReferenceWrite cterm=bold ctermfg=159 ctermbg=236 guibg=#FFAF5F
			]]
		vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
		vim.api.nvim_create_autocmd("CursorHold", {
			callback = vim.lsp.buf.document_highlight,
			buffer = bufnr,
			group = "lsp_document_highlight",
			desc = "Document Highlight",
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			callback = vim.lsp.buf.clear_references,
			buffer = bufnr,
			group = "lsp_document_highlight",
			desc = "Clear All the References",
		})
	end
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
