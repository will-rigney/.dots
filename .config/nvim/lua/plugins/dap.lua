-- dap
-- support for debugging with debug adapter protocol within neovim
-- https://github.com/mfussenegger/nvim-dap

-- dap-ui
-- graphical debugging within neovim
-- https://github.com/rcarriga/nvim-dap-ui

return
{
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			local dap = require "dap"
			-- adapters
			-- lldb-dap
			dap.adapters.lldb = {
				type = 'executable',
				command = '/usr/bin/lldb-dap',
				name = 'lldb'
			}
			-- (that's all for now)

			-- todo: if there's a per project vscode launch configuration don't bother with the default ones

			-- basic asf configuration
			dap.configurations.c = {
				{
					name = 'default debug (lldb)',
					type = 'lldb',
					request = 'launch',
					program = function()
						-- theres a variable to open file picker
						-- todo: doesn't autocomplete, should probably rebuild for you or something
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}', -- current nvim working directory
					stopOnEntry = false, -- todo: stop on entry doesn't work? at least not for c
				},
			}

			-- use same configuration for c, cpp and rust
			dap.configurations.cpp = dap.configurations.c

			-- todo: much fancier rust configuration
			dap.configurations.rust = dap.configurations.c

			-- todo: configuration for python

		end
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			-- other way around actually
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		},
		config = function()
			local dap = require "dap"
			local dapui = require "dapui"
			dapui.setup(
			---@diagnostic disable-next-line: missing-fields
				{
					controls = {
						element = "repl",
						enabled = true,
						-- todo: throw in the keybinds into icons (when they exist)
						icons = {
							disconnect = "disconnect<F8>", -- don't need this one really
							pause = "pause", -- pause??
							play = "play<F1>",
							run_last = "restart<F6>",
							step_back = "back<F5>",
							step_into = "into<F2>",
							step_out = "out<F4>",
							step_over = "over<F3>",
							terminate = "stop<F7>"
						}
					},
					floating = {
						border = "single",
						mappings = {
							close = { "q", "<Esc>" } -- this is what I want for every floating window
						}
					},
					layouts = { {
						elements = { {
							id = "scopes",
							size = 0.50,
						}, {
							id = "breakpoints",
							size = 0.25
						}, {
							id = "stacks",
							size = 0.25
						}
							-- maybe later
							-- , {
							--      id = "watches",
							--      size = 0.25
							--    }
						},
						position = "left",
						size = 60
					}, {
						elements = { {
							id = "repl",
							size = 1.0 --0.6
						}
							-- also maybe later
							-- 			, {
							-- 	id = "console",
							-- 	size = 0.4
							-- }
						},
						position = "bottom",
						size = 10
					} },
					-- todo: whats going on here with these mappings?
					mappings = {
						edit = "e",
						expand = { "<CR>", "<2-LeftMouse>" },
						open = "o",
						remove = "d",
						repl = "r",
						toggle = "t"
					},
					render = {
						indent = 1,
						max_value_lines = 100
					}
				}
			)

			-- open on new session
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			-- close on error
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			-- close on exit
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	}
}
