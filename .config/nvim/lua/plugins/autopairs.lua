-- autopairs
-- automatically insert bracket & tag pairs
-- https://github.com/windwp/nvim-autopairs

return {
	'windwp/nvim-autopairs',
	lazy = true,
	event = {'InsertEnter','CmdlineEnter'},
	dependencies = { 'hrsh7th/nvim-cmp' },
	config = function()
		require('nvim-autopairs').setup {}
		-- automatically add `(` after selecting function or method
		-- todo: more detailed setup with cmp
		local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
		local cmp = require 'cmp'
		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
	end,
}
