-- compiler
-- run compiler from within neovim with basic builtin configurations
-- https://github.com/Zeioth/compiler.nvim

-- todo: replace with vscode tasks style runner
-- integrated with launch.json
return {
	{
		'Zeioth/compiler.nvim',
		cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
		dependencies = { 'stevearc/overseer.nvim', 'nvim-telescope/telescope.nvim' },
		opts = {},
		-- todo: when compiler finished successfully, close the overseer window
	},
	-- task runner
	{
		'stevearc/overseer.nvim',
		commit = '6271cab7ccc4ca840faa93f54440ffae3a3918bd',
		cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
		opts = {
			dap = true,
			task_list = {
				direction = 'bottom',
				min_height = 25,
				max_height = 25,
				default_detail = 1,
				separator = '---',
			},
			form = {
				border = 'none',
			},
			confirm = {
				border = 'none',
			},
			task_win = {
				border = 'none',
			},
		},
	},
}
