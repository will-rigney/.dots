return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup {
				modules = { "highlight", "incremental_selection", "indent" },
				ignore_install = {},
				auto_install = true,
				-- todo: languages I actually use here
				ensure_installed = {
					"asm",
					"c",
					"cpp",
					"csv",
					"bash",
					"lua",
					"rust",
					"javascript", -- svelte? install next time I use
					"typescript",
					"svelte",
					"toml",
					"html",
					"python",
					"css",
					"make",
					"cmake",
					"faust",
					"go",
					"markdown",
					"kotlin",
					"strace",
					"sql",
					"powershell",
					"zig",
					"yaml",
					"nasm",
					"doxygen",
					"dockerfile",
					"kdl"
				},
				sync_install = false,
				-- todo: not sure if these are default values
				highlight = { enable = true },
				indent = { enable = true },
			}
		end
	}
}
