---------------
--- autocmd ---
---------------

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.scrolloff = 0
		vim.bo.filetype = "terminal"
	end,
})

-- WinEnter
vim.api.nvim_create_autocmd("WinEnter", {
	pattern = 'term://*',
	callback = function()
		vim.cmd('startinsert')
	end
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = 'term://*',
	callback = function()
		vim.cmd('startinsert')
	end
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '',
  command = 'startinsert'
})

-- Close terminal buffer on process exit
vim.api.nvim_create_autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})

-- autocmd BufLeave term://* stopinsert
--
-- Don't auto commenting new lines
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})
