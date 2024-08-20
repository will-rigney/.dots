--- keybinds

-- magic remap function
function map(mode, lhs, rhs, options)
	-- default options for every mapping
	local opts = { noremap = true }
	if options then
		options = vim.tbl_extend("force", opts, options)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end
-- map() replaces vim.api.nvim_set_keymap()

--- leader bindings
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

-- code
-- something about opening lsp stuff in quickfix buffer or smth

-- eventually want: completions, doc in tooltips, adding removing breakpoints even

-- files
map('n', '<leader>ft', ':Explore<cr>')						-- open netrw tree
-- <C-w> h returns to already open netrw window
-- todo: pretty janky
-- todo:
-- - '<leader>ff' search for file (telescope?) builtin fuzzy find?

-- source / reload settings
-- todo: maybe change to <leader>r
map('n', '<leader>sr', ':source ~/.config/nvim/init.lua<cr>')		-- init.lua
map('n', '<leader>sk', ':source ~/.config/nvim/keybinds.lua<cr>')	-- keybinds
map('n', '<leader>sl', ':source ~/.config/nvim/statusline.lua<cr>')	-- statusline

-- terminal
-- todo: add some terminal bindings like open term in a minibuffer or something

