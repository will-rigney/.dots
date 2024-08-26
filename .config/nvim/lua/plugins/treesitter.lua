return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				-- modules = {},
				-- ignore_install = {},
				-- auto_install = {},
				-- todo: languages I actually use here
				ensure_installed = {
					"c",
					"bash",
					"lua",
					"rust",
					"javascript", -- svelte? install next time I use
					"html",
					"python",
					"css"
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}
}
