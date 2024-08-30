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
			-- todo: is there more setup to do here?
			-- todo: maybe separate dap ui

			local dap = require "dap"
			-- local dapui = require "dapui"
			-- lldb-dap
			dap.adapters.lldb = {
				type = 'executable',
				command = '/usr/bin/lldb-dap',
				name = 'lldb'
			}

			-- todo: have option to rebuild too
			dap.configurations.c = {
				{
					name = 'Launch',
					type = 'lldb',
					request = 'launch',
					program = function()
						-- todo: doesn't autocomplete, should probably rebuild for you or something
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}', -- todo: does this ${workspaceFolder} come from lsp?
					stopOnEntry = false, -- todo: stop on entry doesn't work? at least not for c
				},
				-- 	maybe attach to running lldb?
				-- 		name = 'Attach to gdbserver :1234',
				-- 		type = 'cppdbg',
				-- 		request = 'launch',
				-- 		MIMode = 'gdb',
				-- 		miDebuggerServerAddress = 'localhost:1234',
				-- 		miDebuggerPath = '/usr/bin/gdb',
				-- 		cwd = '${workspaceFolder}',
				-- 		program = function()
				-- 			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				-- 		end,
				-- 	},
			}

			-- use same configuration for c, cpp and rust
			-- todo: fancier rust configuration
			dap.configurations.cpp = dap.configurations.c
			dap.configurations.rust = dap.configurations.c
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
			-- todo: why doesn't this just silently override missing defaults
				{
					controls = {
						element = "repl",
						enabled = true,
						-- todo: maybe throw in the keybinds into icons
						icons = {
							disconnect = "disconnect",
							pause = "pause",
							play = "play",
							run_last = "rerun",
							step_back = "back",
							step_into = "into",
							step_out = "out",
							step_over = "over",
							terminate = "stop" -- stop?
						}
					},
					element_mappings = {}, -- what does this do?
					floating = {
						border = "single",
						mappings = {
							close = { "q", "<Esc>" }
						}
					},
					force_buffers = true,
					icons = {
						collapsed = "",
						current_frame = "",
						expanded = ""
					},
					-- layouts = { {
					--     elements = { {
					--         id = "scopes",
					--         size = 0.25
					--       }, {
					--         id = "breakpoints",
					--         size = 0.25
					--       }, {
					--         id = "stacks",
					--         size = 0.25
					--       }, {
					--         id = "watches",
					--         size = 0.25
					--       } },
					--     position = "left",
					--     size = 40
					--   }, {
					--     elements = { {
					--         id = "repl",
					--         size = 0.5
					--       }, {
					--         id = "console",
					--         size = 0.5
					--       } },
					--     position = "bottom",
					--     size = 10
					--   } },
					-- whats going on here anyway
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


			-- listener to open dap ui
			-- n.b. shouldn't trigger if initialisation failed
			-- todo: configure dapui to have sane layout
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			-- example config gives on attach and on launch for open

			-- unused listeners
			-- todo: evaluate & test these out
			-- dap.listeners.before.event_terminated["dapui_config"] = function()
			-- 	dapui.close()
			-- end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	}
}
