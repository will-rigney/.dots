-- which-key
-- hints for keymap
-- https://github.com/folke/which-key.nvim

return
{
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		icons = {
			separator = ": ",
			mappings = false
		}
	},
	-- todo: move this bind to keymap file too
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show { global = true }
			end,
			desc = "show buffer local keymaps",
		},
	},
}
