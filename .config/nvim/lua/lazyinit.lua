-- using lazy.nvim for plugin package management
-- pls minimise number of packages to bare minimum

-- bootstrap lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	-- handle error
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out, 'WarningMsg' },
			{ '\npress any key to exit...' },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy
require('lazy').setup {
	spec = {
		{ import = 'plugins' },
	},
	-- automatically check for plugin updates
	checker = { enabled = true },
}
