-- color scheme plugins

return
{
	"miikanissi/modus-themes.nvim",
	priority = 1000,
	config = function()
		require 'modus-themes'.setup {
			variant = "default"

		}
		vim.cmd([[colorscheme modus]])
	end
}
