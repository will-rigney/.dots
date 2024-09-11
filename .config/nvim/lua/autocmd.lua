---------------
--- autocmd ---
---------------

-- todo: sadly stylua not opinionated about line breaks in function calls, has to be enforced by auto formatter
-- todo: why not namespace children of global vim for this file
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- normal line numbers in insert mode, relative in normal mode
autocmd('InsertEnter', { callback = function() vim.opt_local.relativenumber = false end })
autocmd('InsertLeave', { callback = function() vim.opt_local.relativenumber = true end })

-- don't auto comment new lines
-- this seems potentially not efficient or correct
autocmd('BufEnter', { pattern = '', command = 'set fo-=c fo-=r fo-=o' })

--- terminal
-- set local settings for terminal buffers using ftplugin
-- needed for settings changes in `terminal.lua`
	-- group = augroup('custom-term-open', {}),

augroup('custom-term', { clear = true }) -- is this wack name needed to avoid collisions?
-- what does clear parameter do also
autocmd('TermOpen', { callback = function() vim.bo.filetype = 'terminal' end, })

-- simple startinsert on new terminal open
autocmd('TermOpen', { pattern = '', command = 'startinsert' })

-- auto insert mode entering terminal window
-- these are all slightly different events, see `:h events` for more information
-- autocmd('WinEnter', { pattern = 'term://*', command = 'startinsert' })
-- autocmd('BufEnter', { pattern = 'term://*', command = 'startinsert' })
autocmd('BufWinEnter', { pattern = 'term://*', command = 'startinsert' })

-- auto close after teminal command complete, skip return value
-- this might ruin the leader leader terminal binding
autocmd('TermClose', { pattern = 'term://*', callback = function() vim.api.nvim_input '<cr>' end })

-- close terminal buffer on process exit
-- stopinsert?
-- autocmd('BufLeave', { pattern = 'term://*', command = 'stopinsert' })

-- may be the greatest thing ever
autocmd('InsertLeave', { callback = function() print('', require('decor').get_decoration()) end })

-- make sure decor not too loud
-- todo: maybe make random chance whether decor appears?

-- would be better to have this added buffer locally on attach to lsp event
-- show diagnostics under the cursor when holding position
-- vim.api.nvim_create_augroup('lsp_diagnostics_hold', { clear = true })
autocmd({ 'CursorHold' }, { pattern = '*', callback = function () vim.diagnostic.open_float() end })

-- autocmd for making sure gitsigns is loaded
autocmd('BufNew', { callback = function () require'gitsigns'.refresh() end })

