-- dap
-- support for debugging with debug adapter protocol within neovim
-- https://github.com/mfussenegger/nvim-dap

-- dap-ui
-- graphical debugging within neovim
-- https://github.com/rcarriga/nvim-dap-ui

-- todo: auto enter insert mode when entering dapui repl window

return {
	{
		'rcarriga/nvim-dap-ui',
		dependencies = {
			'nvim-neotest/nvim-nio',
		},
		lazy = true,
		opts = {
			controls = {
				element = 'repl',
				enabled = true,
				icons = {
					disconnect = 'disconnect<F8>',
					pause = 'pause', -- pause?? todo: no binding for pause
					play = 'play<F1>',
					run_last = 'restart<F6>',
					step_back = 'back<F5>',
					step_into = 'into<F2>',
					step_out = 'out<F4>',
					step_over = 'over<F3>',
					terminate = 'stop<F7>',
				},
			},
			floating = {
				border = 'single',
				mappings = {
					close = { 'q', '<Esc>' }, -- todo: this is what I want for every floating window
				},
			},
			layouts = {
				{
					-- expand scopes, shrink everything else
					elements = {
						{
							id = 'scopes',
							size = 0.40,
						},
						{
							id = 'stacks',
							size = 0.15,
						},
						{
							id = 'breakpoints',
							size = 0.15,
						},
						{
							id = 'watches',
							size = 0.15,
						},
						{
							id = 'console',
							size = 0.15,
						},
					},
					position = 'right',
					size = 60,
				},
				{
					elements = {
						'repl',
					},
					position = 'bottom',
					size = 8,
				},
			},
			-- todo: whats going on here with these mappings?
			mappings = {
				edit = 'e',
				expand = { '<CR>', '<2-LeftMouse>' },
				open = 'o',
				remove = 'd',
				repl = 'r',
				toggle = 't',
			},
			render = {
				indent = 1,
				max_value_lines = 100,
			},
		},
		-- using .vscode/launch.json configuration files as they work very nicely with nvim-dap
		-- doesn't work for launch.json in parent directory, opposite of vscode behaviour
	},
	{
		'mfussenegger/nvim-dap',
		lazy = true,
		dependencies = {
			'rcarriga/nvim-dap-ui',
			'rcarriga/cmp-dap',
			'hrsh7th/nvim-cmp',
		},
		config = function()
			local dap = require 'dap'
			-- lldb adapter
			dap.adapters.lldb = {
				type = 'executable',
				command = '/usr/bin/lldb-dap',
				name = 'lldb',
			}

			local dapui = require 'dapui'
			dap.listeners.after.event_initialized.dapui_config = function() dapui.open() end

			-- close on error
			-- todo: don't close on error?
			dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end

			-- close on exit
			dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

			-- also cmp sources
			local cmp = require 'cmp'
			cmp.setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
				sources = {
					{ name = 'dap' },
				},
			})

			-- add configurations using per-project launch.json files
			-- these bindings are too late -  perfect for keys
			local set = vim.keymap.set
			-- no bind for pause currently
			set('n', '<F1>', dap.continue)
			set('n', '<F2>', dap.step_into)
			set('n', '<F3>', dap.step_over)
			set('n', '<F4>', dap.step_out)
			set('n', '<F5>', dap.step_back)
			set('n', '<F6>', dap.restart)
			set('n', '<F7>', dap.stop) -- todo: dap.stop & dap.close both don't seem to do anything
			set('n', '<F8>', dap.disconnect)
		end,
	},
	{
		'leoluz/nvim-dap-go',
		ft = 'go',
		lazy = true,
		config = function() require('dap-go').setup() end,

		-- need go adapters loaded
	},
	{
		'mfussenegger/nvim-dap-python',
		ft = 'python',
		lazy = true,
		config = function() require('dap-python').setup() end,
	},
}
