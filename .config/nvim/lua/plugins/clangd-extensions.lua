-- extra clangd extensions, notably switch source header
--

return {
	'p00f/clangd_extensions.nvim',
	ft = 'c', -- only load on c files
	dependencies = {
		{ 'neovim/nvim-lspconfig' },
	},
	config = function()
		-- clang exclusive, n.b. binding should work for sourcekit / objective-c too
		vim.keymap.set('n', '<leader>ch', '<cmd>ClangdSwitchSourceHeader<cr>', { desc = '[c]ode switch source [h]eader' })
	end,
}
