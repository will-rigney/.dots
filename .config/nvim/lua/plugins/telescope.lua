-- telescope
-- unified fuzzy finding
-- https://github.com/nvim-telescope/telescope.nvim

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8', -- version
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- 'telescope-fzf-native.nvim' -- todo: need to build I think
	}
}
