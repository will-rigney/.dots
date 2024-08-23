--- keybinds

-- magic remap function
-- should be local!
local function map(mode, lhs, rhs, options)
	-- default options for every mapping
	local opts = { noremap = true }
	if options then
		options = vim.tbl_extend("force", opts, options)
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end
-- map() replaces vim.api.nvim_set_keymap() / vim.keymap.set()

-- clear search highlights with escape
map('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- leader (<space>)
map('n', '<space>', '')
vim.g.mapleader = ' '							-- map leader to comma
vim.g.maplocalleader = ' '

-- buffer
map('n', '<leader>bl', ':buffers<cr>')
map('n', '<leader>bd', ':bdelete<cr>')
map('n', '<leader>bn', ':bNext<cr>')

-- window
map('n', '<leader>w', '<C-w>')
-- faster close window
map('n', '<leader>q', '<C-w>q')

-- g
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})

-- code
-- something about opening lsp stuff in quickfix buffer or smth
-- these keys currently setup in plugin file but should be here for consistency
-- throw an error if no lsp running don't not bind
-- vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float()') 
-- what about map function from keybinds module

-- vim.lsp.buf.completion open auto in insert mode pls
-- ig only when lsp active? or all the time including for words...
-- vim.cmd('autocmd CursorHold * lua vim.lsp.buf.hover()') 
vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set({'n', 'v'}, '<leader>cf', vim.lsp.buf.format, {})
vim.keymap.set({'n', 'v'}, '<leader>cd', vim.lsp.buf.hover, {})
-- vim.lsp.buf.completion
-- vim.lsp.buf.format

-- git (<leader>g)


-- eventually want: completions, doc in tooltips, adding removing breakpoints even
-- stage hunk

-- files
map('n', '<leader>ft', ':Explore<cr>')						-- open netrw tree
-- map('n', '<leader>fn', ':Explore<cr>')						-- create new empty buffer?
-- <C-w> h returns to already open netrw window
-- todo: pretty janky
-- todo:
-- - '<leader>ff' search for file (telescope?) builtin fuzzy find?

-- reload config files
map('n', '<leader>rc', ':source ~/.config/nvim/init.lua<cr>')		-- init.lua
map('n', '<leader>rk', ':source ~/.config/nvim/lua/keybinds.lua<cr>')	-- keybinds
map('n', '<leader>rl', ':source ~/.config/nvim/lua/statusline.lua<cr>')	-- statusline

-- search
map('n', '<leader>sh', '')											-- search help (todo)

-- todo: vimgrep binding? or telescope i suppose

-- terminal
-- todo: add some terminal bindings like open term in a minibuffer or something
-- not sure terminal in neovim actually a good idea, should just use actual terminal

