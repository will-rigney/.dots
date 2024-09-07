-- extra clangd extensions, notably switch source header
--

return {
	'p00f/clangd_extensions.nvim',
	ft = 'c', -- only load on c files
	dependencies = {
		{ 'neovim/nvim-lspconfig' },
	},
}
