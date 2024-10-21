---------------
--- autocmd ---
---------------

-- todo: sadly stylua not opinionated about line breaks in function calls, has to be enforced by auto formatter
-- todo: why not namespace children of global vim for this file
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- todo: should have custom autocmd in group, reset group & reload file

-- todo: this should be used to remove and reinit existing autocmds
augroup('custom-term', { clear = true })
-- then use:
-- group = augroup('custom-term-open', {}),

-- general

-- don't auto comment new lines
-- todo: might be bit heavy handed
autocmd('BufEnter', { pattern = '', command = 'set fo-=c fo-=r fo-=o' })

-- may be the greatest thing ever
autocmd('InsertLeave', { callback = function() print('', require('decor').get_decoration()) end })

--- terminal

-- set terminal config (aka filetype)
-- needed for settings changes in `terminal.lua`
autocmd('TermOpen', { callback = function() vim.bo.filetype = 'terminal' end })

-- simple startinsert on new terminal open
autocmd('TermOpen', { pattern = '', command = 'startinsert' })

-- auto insert mode entering terminal window
-- these are all slightly different events, see `:h events` for more information
-- autocmd('WinEnter', { pattern = 'term://*', command = 'startinsert' })
-- autocmd('BufEnter', { pattern = 'term://*', command = 'startinsert' })
-- autocmd('BufWinEnter', { pattern = 'term://*', command = 'startinsert' })

-- auto close after teminal command complete, skip return value
autocmd('TermClose', { pattern = 'term://*', callback = function() vim.api.nvim_input '<cr>' end })

-- diagnostics

-- would probably be better to have this added buffer locally on attach to lsp event
-- show diagnostics under the cursor when holding position
-- augroup('lsp_diagnostics_hold', { clear = true })

-- todo don't try and open if any pup / hover is already open
autocmd({ 'CursorHold' }, { pattern = '*', callback = function() vim.diagnostic.open_float() end })
