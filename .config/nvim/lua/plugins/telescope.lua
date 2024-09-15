-- telescope
-- unified fuzzy finding
-- https://github.com/nvim-telescope/telescope.nvim

-- todo: bindings for e.g. open in new tab, open in split (already exists but unclear)
-- todo: make which-key in telescope finders more useful

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
				-- defaults (overridden for individual pickers)
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
						-- fill binary files with decoratively tiling string
						msg_bg_fillchar = require('decor').get_tile(),
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
