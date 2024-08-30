-- gitsigns
-- basic git integration for neovim
-- https://github.com/lewis6991/gitsigns.nvim

return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = function ()
		require 'gitsigns'.setup()
	end
}
