-- telescope
-- unified fuzzy finding
-- https://github.com/nvim-telescope/telescope.nvim

return
{
	{
		'nvim-telescope/telescope.nvim',
		event = "VeryLazy",
		tag = '0.1.8', -- version (not latest?)
		dependencies = {
			'nvim-lua/plenary.nvim',
		}
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		event = "VeryLazy",
		build = 'make',
		dependencies = {
			'nvim-telescope/telescope.nvim'
		},
		config = function()
			local telescope = require('telescope')
			telescope.setup {
				defaults = {
					border = false
				}
			}
			telescope.load_extension('fzf')
		end
	}
}
