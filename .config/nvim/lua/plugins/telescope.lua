-- telescope
-- unified fuzzy finding

-- https://github.com/nvim-telescope/telescope.nvim

return {
	{
		'nvim-telescope/telescope.nvim',
		lazy = true,
		tag = '0.1.8', -- version (not latest?)
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzf-native.nvim',
		},
		config = function()
			local telescope = require 'telescope'
			telescope.setup {
				-- want to set max size for prompt side
				defaults = {
					selection_carret = ' ',
					prompt_prefix = '',
					layout_config = {
						-- fullscreen
						horizontal = {
							width = { padding = 0 },
							height = { padding = 0 },
							-- preview half screen width
							preview_width = 0.5,
						},
					},
					preview = {
						msg_bg_fillchar = ' ',
					},
					border = true,
					-- empty borderchars to disable border without leaving gap
					borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
				},
			}
			telescope.load_extension 'fzf'
		end,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		lazy = true,
		build = 'make',
	},
}
