-- dap
-- support for debugging with debug adapter protocol within neovim
-- https://github.com/mfussenegger/nvim-dap

-- dap-ui
-- graphical debugging within neovim
-- https://github.com/rcarriga/nvim-dap-ui

-- todo: auto enter insert mode when entering dapui repl window

return {
	{
		'mfussenegger/nvim-dap',
		config = function()
			local dap = require 'dap'
			-- lldb adapter
			dap.adapters.lldb = {
				type = 'executable',
				command = '/usr/bin/lldb-dap',
				name = 'lldb',
			}

			-- add configurations using per-project launch.json files
		end,
	},
	{
		'leoluz/nvim-dap-go',
		ft = 'go',
	},
	{
		'mfussenegger/nvim-dap-python',
		ft = 'python',
		config = function()
			require('dap-python').setup()
		end,
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = {
			'mfussenegger/nvim-dap',
			'nvim-neotest/nvim-nio',
		},
		config = function()
			local dap, dapui = require 'dap', require 'dapui'
			---@diagnostic disable-next-line: missing-fields
			dapui.setup {
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
			}
			-- using .vscode/launch.json configuration files as they work very nicely with nvim-dap

			-- open on new session
			dap.listeners.after.event_initialized.dapui_config = function()
				dapui.open()
			end

			-- close on error
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end

			-- close on exit
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
