return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio"
		},
		config = function()
			-- local lspconfig = require("lspconfig"
			local dap = require "dap"
			-- local ui = require "dapui"

			require("dapui").setup()

			-- uh oh, dap only keymaps
			vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)

			-- todo: change this one
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
		end
	},
}
