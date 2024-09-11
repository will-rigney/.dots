-- alpha.nvim
-- customisable greeter / dashboard buffer for neovim

return {
	'goolord/alpha-nvim',
	config = function()
		local alpha = require 'alpha'
		local alpha_theme = require 'alpha-theme'
		alpha.setup(alpha_theme.config)
	end,
}
