-- telescope
-- unified fuzzy finding

-- https://github.com/nvim-telescope/telescope.nvim

return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8', -- version (not latest?)
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzf-native.nvim',
		},
		config = function()
			local telescope = require 'telescope'
			-- ---@type telescope.Config
			telescope.setup {
				defaults = {
					border = true,
					-- empty borderchars to disable border without leaving gap
					borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
				},
			}
			telescope.load_extension 'fzf'
		end,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
	},
}
