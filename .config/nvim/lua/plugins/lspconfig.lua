-- lsp-config
-- community sourced configs for lsp integrations
-- https://github.com/neovim/nvim-lspconfig

return
{
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require "lspconfig"

		-- setup language servers
		lspconfig.bashls.setup {}
		lspconfig.rust_analyzer.setup {}
		lspconfig.lua_ls.setup {}
		lspconfig.clangd.setup {}
		lspconfig.pyright.setup {}

		-- todo: make sure filetype for c/cpp headers accepted

		-- reload for current file
		vim.api.nvim_exec_autocmds("FileType", {})
	end
}
