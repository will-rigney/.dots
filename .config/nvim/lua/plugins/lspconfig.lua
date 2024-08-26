return
{
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require "lspconfig"
		-- setup lsps
		lspconfig.bashls.setup {}
		lspconfig.rust_analyzer.setup {}
		lspconfig.lua_ls.setup {}
		lspconfig.clangd.setup {}
		lspconfig.pyright.setup {}

		-- lspconfig.clangd = {
		-- 	init_options = { clangdFileStatus = true },
		-- 	filetypes = { "c" }, -- todo: make sure filetype for headers accepted
		-- 		-- todo: clangd c++?
		-- }
		-- lspconfig.clangd.setup()
	end
}
