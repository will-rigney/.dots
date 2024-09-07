--- oil.nvim
-- edit directory in buffer
--

return {
	'stevearc/oil.nvim',
	-- ---@module 'oil'
	-- ---@type oil.SetupOpts
	opts = {
		default_file_explorer = true,
		watch_for_changes = true,
		constrain_cursor = 'name',
		view_options = {
			show_hidden = true,
		},
		columns = {
			'permissions',
			'size',
			'mtime',
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
