-- extra clangd extensions, notably switch source header
--
--
return {
	"p00f/clangd_extensions.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
	},
}
