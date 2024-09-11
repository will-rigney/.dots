--- oil.nvim
-- edit directory in buffer
--

return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		skip_confirm_for_simple_edits = true,
		default_file_explorer = true,
		watch_for_changes = true,
		constrain_cursor = 'name',
		use_default_keymaps = false, -- copied below, n.b. might breaking change one day
		keymaps = {
			['g?'] = 'actions.show_help',
			['<CR>'] = 'actions.select',
			-- <C-s> & <C-h> is wrong, should be same as bindings elsewhere e.g. telescope
			['<C-s>'] = { 'actions.select', opts = { vertical = true }, desc = 'open the entry in a vertical split' },
			['<C-h>'] = { 'actions.select', opts = { horizontal = true }, desc = 'open entry in a horizontal split' },
			['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'open entry in new tab' },
			['<C-p>'] = { 'actions.preview', desc = 'open preview' }, -- not sure about this bindings
			['<C-c>'] = { 'actions.close', desc = 'close oil' },
			['<C-l>'] = { 'actions.refresh', desc = 'refresh oil' }, -- should need to do as watching is enabled
			['-'] = { 'actions.parent', desc = 'open parent directory' },
			['_'] = { 'actions.open_cwd', desc = 'open currend working directory' },
			['`'] = { 'actions.cd', desc = 'cd here' },
			['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory' },
			['gs'] = 'actions.change_sort',
			['gx'] = 'actions.open_external',
			['g.'] = 'actions.toggle_hidden',
			['g\\'] = 'actions.toggle_trash',
		},
		view_options = {
			show_hidden = true,
			natural_order = true, -- false more machine like & performant
		},
		columns = {
			'permissions',
			'size',
			'mtime',
		},
		preview = {
			border = 'none',
		},
		progress = {
			border = 'none',
		},
		-- floating entry window
		float = {
			border = 'none',
		},
		-- floating SSH window
		ssh = {
			border = 'none',
		},
		-- floating keymaps help window
		keymaps_help = {
			border = 'none',
		},
	},
}
