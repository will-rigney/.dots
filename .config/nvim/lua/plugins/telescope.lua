-- telescope
-- unified fuzzy finding
-- https://github.com/nvim-telescope/telescope.nvim

return
{
	{
		'nvim-telescope/telescope.nvim',
		lazu = true,
		tag = '0.1.8', -- version (not latest?)
		dependencies = {
			'nvim-lua/plenary.nvim',
		}
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		dependencies = {
			'nvim-telescope/telescope.nvim'
		},
		config = function()
			local telescope = require 'telescope'
			telescope.setup {
				defaults = {
					border = false,
					-- todo: remove 1 column gap between results & preview
				}
			}
			telescope.load_extension('fzf')
		end
	}
}
