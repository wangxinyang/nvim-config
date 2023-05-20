require("config.options")
require('config.lazy_nvim')

vim.api.nvim_create_autocmd('User', {
	pattern = 'VeryLazy',
	callback = function()
	require("config.mappings")
  end,
})