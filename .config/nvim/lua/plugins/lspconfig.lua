-- lsp-config
-- community sourced configs for lsp integrations
-- https://github.com/neovim/nvim-lspconfig

return
{
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{ "j-hui/fidget.nvim" },
	},
	config = function()
		local lspconfig = require "lspconfig"

		-- setup language servers
		lspconfig.bashls.setup {}
		lspconfig.rust_analyzer.setup {}
		lspconfig.lua_ls.setup {}

		-- not sure we need this with clangd extensions
		lspconfig.clangd.setup {}

		lspconfig.pyright.setup {}
		-- lspconfig.jedi_language_server.setup {}

		-- todo: .h currently recognised as cpp headers not c

		-- reload for current file
		vim.api.nvim_exec_autocmds("FileType", {})
	end
}
