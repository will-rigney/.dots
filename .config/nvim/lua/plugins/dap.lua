-- dap
-- support for debugging with debug adapter protocol within neovim
-- https://github.com/mfussenegger/nvim-dap

-- also dap specific language support for go & dap python

-- todo: autocmd enter insert mode when entering dapui repl window

return {
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
	},
	{
		'mfussenegger/nvim-dap-python',
		ft = 'python',
		lazy = true,
		config = function() require('dap-python').setup() end,
	},
}
