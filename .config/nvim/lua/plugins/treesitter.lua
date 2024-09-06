return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup {
				modules = { "highlight", "incremental_selection", "indent" },
				ignore_install = {},
				auto_install = true,
				ensure_installed = {
					"asm",
					"bash",
					"c",
					"cmake",
					"cpp",
					"css",
					"csv",
					"dockerfile",
					"doxygen",
					"faust",
					"git_config",
					"gitignore",
					"go",
					"html",
					"javascript",
					"kdl",
					"kotlin",
					"lua",
					"luadoc",
					"make",
					"markdown",
					"nasm",
					"powershell",
					"python",
					"rust",
					"sql",
					"strace",
					"supercollider",
					"svelte",
					"swift",
					"toml",
					"typescript",
					"udev",
					"vim",
					"vimdoc",
					"yaml",
					"zig",
				},
				sync_install = false,
				-- todo: not sure if these are default values
				highlight = { enable = true },
				indent = { enable = true },
			}
		end
	}
}
