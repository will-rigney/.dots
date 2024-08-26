----------------
--- keybinds ---
----------------

-- magic remap function
local function map(mode, lhs, rhs, options)
	-- default options for every mapping
	local opts = {
		-- don't think we need this no recursive setting if binds are right
		noremap = true
	}
	if options then
		options = vim.tbl_extend("force", opts, options)
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- map() replaces vim.api.nvim_set_keymap() / vim.keymap.set()

-- clear search highlights with escape
-- todo: this mapping bit of a blunt instrument
map('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- leader (<space>)
-- map('n', '<space>', '')
--
-- buffer
map('n', '<leader>bl', ':buffers<cr>')
map('n', '<leader>bd', ':bdelete<cr>')
map('n', '<leader>bn', ':bNext<cr>')
map('n', '<leader>bp', ':bprevious<cr>')

-- window
map('n', '<leader>w', '<C-w>')
-- faster close window
map('n', '<leader>q', '<C-w>q')

-- vim users really have to gall to say emacs pinky

-- g
map('n', 'gd', vim.lsp.buf.definition, {})
map('n', 'gD', vim.lsp.buf.declaration, {})
map("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })

-- code
-- something about opening lsp stuff in quickfix buffer or smth
-- these keys currently setup in plugin file but should be here for consistency
-- throw an error if no lsp running don't not bind
-- vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float()')
-- what about map function from keybinds module

-- vim.lsp.buf.completion open auto in insert mode pls
-- ig only when lsp active? or all the time including for words...
-- vim.cmd('autocmd CursorHold * lua vim.lsp.buf.hover()')
map("n", "K", vim.lsp.buf.hover, { buffer = 0 })
map('n', '<leader>ca', vim.lsp.buf.code_action, {})
map({ 'n', 'v' }, '<leader>cf', vim.lsp.buf.format, {})
map("n", "<rename>cr", vim.lsp.buf.rename, { buffer = 0 })
-- vim.cmd('autocmd CursorHold * lua vim.lsp.buf.completion()')

-- todo:
-- vim.lsp.buf.completion

-- git (<leader>g)


-- eventually want: completions, doc in tooltips, adding removing breakpoints even
-- stage hunk

-- files (find?)
-- maybe change this
map('n', '<leader>ft', ':Explore<cr>') -- open netrw tree

-- haven't loaded this yet (i get it)
-- rough to have to split up keymap into different files
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- map('n', '<leader>fn', '')						-- create new empty buffer?
-- <C-w> h returns to already open netrw window

-- todo:
-- '<leader>ff' search for file (telescope?) builtin fuzzy find?
-- vimgrep binding? or telescope i suppose

-- search
map('n', '<leader>sh', '') -- search help (todo)

-- reload config files
map('n', '<leader>rc', ':source ~/.config/nvim/init.lua<cr>')           -- init.lua
map('n', '<leader>rk', ':source ~/.config/nvim/lua/keybinds.lua<cr>')   -- keybinds
map('n', '<leader>rl', ':source ~/.config/nvim/lua/statusline.lua<cr>') -- statusline

-- terminal
-- not sure terminal in neovim actually a good idea, should just use actual terminal
-- starting to come around to the idea
map({ "n", "v" }, '<leader>t', ':terminal<cr>') -- open terminal
-- note doesn't work
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>") -- escape from terminal
-- n.b. haven't figured out terminal workflow yet
