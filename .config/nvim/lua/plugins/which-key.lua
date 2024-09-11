-- which-key
-- hints for keymap
-- https://github.com/folke/which-key.nvim

return {
	'folke/which-key.nvim',
	opts = {
		-- preset = "modern", -- classic, modern or helix (modern on the right)
		preset = 'classic',
		filter = function(mapping)
			-- exclude mappings without a description
			return mapping.desc and mapping.desc ~= ''
		end,
		plugins = {
			presets = {
				windows = false,
			},
		},
		icons = {
			separator = ': ',
			mappings = false,
			breadcrumb = '>', -- symbol used in the command line area that shows your active key combo
			group = '+', -- symbol prepended to a group
			ellipsis = '...',
			-- use the highlights from `WhichKeyIcon`
			colors = true,
			-- used by key format
			keys = {
				C = '<ctrl> ',
				S = '<shift> ',
				CR = '<cr> ',
				Esc = '<esc> ',
				NL = '󰌑 ',
				BS = '<bs> ',
				Space = '<space> ',
				Tab = '<tab> ',
				F1 = '<F1>',
				F2 = '<F2>',
				F3 = '<F3>',
				F4 = '<F3>',
				F5 = '<F5>',
				F6 = '<F6>',
				F7 = '<F7>',
				F8 = '<F8>',
				F9 = '<F9>',
				F10 = '<F10>',
				F11 = '<F11>',
				F12 = '<F12>',
			},
		},
		show_help = true,
		show_keys = true,
		win = {
			-- don't allow the popup to overlap with the cursor
			no_overlap = true,
			border = 'none',
		},
	},
}
