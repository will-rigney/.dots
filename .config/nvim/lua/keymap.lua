----------------
--- keybinds ---
----------------

-- todo: new project: don't have the group name in the individual bind descriptions
-- todo: don't close window when we delete a buffer, move to next buffer in same window
-- todo: same with tabs, dont close when deleting buffers

-- vim users really have to gall to say emacs pinky

-- todo: figure out how to remove so much dependence on control key, maybe bind capslock held to control pressed to escape (seems like some nerd brittleness)

local set = vim.keymap.set

--- which-key
local wk = require 'which-key'
-- groups
set('n', '<leader>?', function() wk.show { global = true } end, { desc = 'show keymaps' })
wk.add {
	{ '<leader>', group = '+leader' },
	{ '<leader>b', group = '+[b]uffer' },
	{ '<leader>c', group = '+[c]ode' },
	{ '<leader>d', group = '+[d]ebug' },
	{ '<leader>f', group = '+[f]ind' },
	{ '<leader>r', group = '+[r]eload' },
	{ '<leader>t', group = '+[t]ab' },
	{ '<leader>g', group = '+[g]it' },
	{ '<leader>w', group = '+[w]indow' },
	{ '[', group = '+jump previous' },
	{ ']', group = '+jump next' },
	{ 'g', group = '+mystic g' },
	{ 'z', group = '+folds+scrolls' },
	{ ';', desc = 'jump to next f/t-result' },
	{ '<c-i>', desc = 'into the jumplist' },
	{ '<c-o>', desc = 'out of the jumplist' },
}

-- todo: worlds useful bind for markdown [[, ]] not in which key

set('n', '<leader>i', '<c-i>', { desc = 'into the jumplist' })
set('n', '<leader>o', '<c-o>', { desc = 'out of the jumplist' })

-- todo: think about window navigation with <leader>hjkl instead of buffer / tab
-- todo: should move to side window or to next tab if no window in that direction

--- window
-- todo: more wincmd e.g. H, J, K, L
set('n', '<leader>w', '<C-w>')
wk.add {
	{ '<leader>w+', desc = 'increase height' },
	{ '<leader>w-', desc = 'decrease height' },
	{ '<leader>w<', desc = 'decrease width' },
	{ '<leader>w=', desc = 'equally high and wide' },
	{ '<leader>w>', desc = 'increase width' },
	{ '<leader>wT', desc = 'break out into a new tab' },
	{ '<leader>w_', desc = 'max out the height' },
	{ '<leader>wh', desc = 'go to the left window' },
	{ '<leader>wj', desc = 'go to the down window' },
	{ '<leader>wk', desc = 'go to the up window' },
	{ '<leader>wl', desc = 'go to the right window' },
	{ '<leader>wo', desc = 'close all other windows' },
	{ '<leader>wq', desc = 'quit a window' },
	{ '<leader>ws', desc = 'split window' },
	{ '<leader>wv', desc = 'split window vertically' },
	{ '<leader>ww', desc = 'switch windows' },
	{ '<leader>wx', desc = 'swap current with next' },
	{ '<leader>w|', desc = 'max out the width' },
}

-- todo: nvim version
set('n', '<leader>wd', '<cmd>close<cr>', { desc = '[d]elete' })

-- add Z options
set('n', 'Z', '<cmd>write<cr>', { desc = 'write buffer' }) -- forget those other Z binds

-- remove default <C-W> diagnostic bindings
set('n', '<C-W>d', '')
set('n', '<C-W><C-D>', '')

-- run current buffer contents in program
set('n', '<leader>R', ':w !', { desc = 'run program on buffer contents' })

-- clear search highlights with escape
set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'clear search highlight' })

-- main navigation keys (bit experimental, todo: hydra mode)
set('n', '<leader>h', '<cmd>tabprevious<cr>')
set('n', '<leader>l', '<cmd>tabnext<cr>')
set('n', '<leader>j', '<cmd>bprevious<cr>')
set('n', '<leader>k', '<cmd>bnext<cr>')

-- buffer
-- todo: I don't want this to delete the window normally, just go to a different open buffer and delete the current one
-- should be like bprevious but the open buffer is removed from buffer list
-- set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = '[d]elete' })

-- delete buffer without closing window
set('n', '<leader>bd', '<cmd>bp|bd #<cr>', { desc = '[d]elete' })
-- good job, now to fix every other place window is closed from contents closing
set('n', '<leader>bc', '<cmd>enew<cr>', { desc = '[c]reate' })
set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = '[n]ext' })
set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = '[p]revious' })
-- duplicate with h & l
set('n', '<leader>bl', '<cmd>bnext<cr>', { desc = '[n]ext' })
set('n', '<leader>bh', '<cmd>bprevious<cr>', { desc = '[p]revious' })

-- tab
set('n', '<leader>th', '<cmd>tabprevious<cr>')
set('n', '<leader>tl', '<cmd>tabnext<cr>')
set('n', '<leader>td', '<cmd>tabclose<cr>', { desc = '[d]elete' })
set('n', '<leader>tn', '<cmd>tabnext<cr>', { desc = '[n]ext' })
set('n', '<leader>tp', '<cmd>tabprevious<cr>', { desc = '[p]revious' })
set('n', '<leader>tc', '<cmd>tabnew<cr>', { desc = '[c]reate' })

-- oil vinegar bind
set('n', '-', function() require('oil').open() end, { desc = 'open parent directory' })

-- todo: either don't have these binds if no lsp or replace with treesitter equivalents
-- mystic g
set('n', 'gd', vim.lsp.buf.definition, { desc = '[g]o to [d]efinition' })
set('n', 'gD', vim.lsp.buf.declaration, { desc = '[g]o to [D]eclaration' })
set('n', 'gT', vim.lsp.buf.type_definition, { buffer = 0, desc = '[g]o to [T]ype definition' }) -- why is buffer needed?
set('n', 'gi', vim.lsp.buf.implementation, { desc = '[g]o to [T]ype definition' })
-- todo: this is sometimes not as good as <c-]> follow tag, might be way to all in one with treesitter gtd for best results
-- see: https://github.com/hrsh7th/nvim-gtd

-- todo: need to add descriptions for more of the default bindings for g, e.g. gq

--- code

-- todo: scroll hover display & q to close, everything except q closes currently
-- lsp
set('n', 'K', vim.lsp.buf.hover, { desc = 'hover lsp documentation' })
set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[c]ode [a]ction' })
set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[r]ename' })
set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'show [d]iagnostic' })
set('n', '<leader>cs', vim.lsp.buf.signature_help, { desc = '[s]ignature help' })
set('n', '<leader>cL', '<cmd>LspInfo<cr>', { desc = '[L]SP info' })

-- conform
set({ 'n', 'v' }, '<leader>cf', function() require('conform').format() end, { desc = '[f]ormat' })

-- telescope builtin mappings
-- for very verbose mappings get lazy loading
-- todo: this should sort results by line number
set('n', '<leader>/', function() require('telescope.builtin').current_buffer_fuzzy_find() end, { desc = 'fuzzy search current buffer' })
set('n', '<leader>:', function() require('telescope.builtin').commands() end, { desc = 'fuzzy run command' })
set('n', '<leader>C', function() require('telescope.builtin').colorscheme { enable_preview = true } end, { desc = '[C]olour schemes' })
--- find
set('n', '<leader>f/', function() require('telescope.builtin').live_grep() end, { desc = 'ripgrep' })
set('n', '<leader>ff', function() require('telescope.builtin').fd() end, { desc = '[f]ile' })
set('n', '<leader>fF', function() require('telescope.builtin').fd { hidden = true } end, { desc = 'hidden [F]ile' })
set('n', '<leader>fr', function() require('telescope.builtin').oldfiles() end, { desc = '[r]ecent files' })
-- todo: would be cool to have tree sitter completions here
set('n', '<leader>ft', function() require('telescope.builtin').treesitter() end, { desc = '[t]reesitter' })
set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = '[b]uffer' })
set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = '[h]elp' })
set('n', '<leader>fs', function() require('telescope.builtin').grep_string() end, { desc = '[s]tring' })
set('n', '<leader>fm', function() require('telescope.builtin').man_pages() end, { desc = '[m]an page' })
-- this will checkout the chosen commit on <cr>
set('n', '<leader>fc', function() require('telescope.builtin').git_bcommits() end, { desc = 'buffer [c]ommits' })
set('n', '<leader>fC', function() require('telescope.builtin').git_commits() end, { desc = 'directory [C]ommits' })
set('n', '<leader>fG', function() require('telescope.builtin').git_status() end, { desc = '[G]it diff' })
set('n', '<leader>fg', function() require('telescope.builtin').git_files() end, { desc = '[g]it files' })
-- find with lsp
set('n', '<leader>fs', function() require('telescope.builtin').lsp_document_symbols() end, { desc = 'document [s]ymbols' })
set('n', '<leader>fS', function() require('telescope.builtin').lsp_workspace_symbols() end, { desc = 'workspace [S]ymbols' }) -- weirdly only has types, at least in rust-analyzer
set('n', '<leader>fR', function() require('telescope.builtin').lsp_references() end, { desc = '[R]eferences' })
set('n', '<leader>fi', function() require('telescope.builtin').lsp_implementations() end, { desc = '[i]mplementations' })
set(
	'n',
	'<leader>fd',
	function() require('telescope.builtin').diagnostics { severity_limit = vim.diagnostic.severity.ERROR } end,
	{ desc = 'error [d]iagnostics' }
)
set('n', '<leader>fD', function() require('telescope.builtin').diagnostics() end, { desc = 'all [D]iagnostics' })

-- reload config files
-- todo: maybe add some bindings to open these files in new buffers with config as the root or lsp disabled
-- set('n', '<leader>rc', '<cmd>source $HOME/.config/nvim/init.lua<cr>', { desc = '[r]eload [c]onfig' })
set('n', '<leader>ro', '<cmd>source $HOME/.config/nvim/lua/options.lua<cr>', { desc = '[o]ptions' })
set('n', '<leader>rk', '<cmd>source $HOME/.config/nvim/lua/keymap.lua<cr>', { desc = '[k]eymap' })
set('n', '<leader>rl', '<cmd>source $HOME/.config/nvim/lua/statusline.lua<cr>', { desc = '[s]tatusline' })

--- applications
-- lazy
set('n', '<leader>L', '<cmd>Lazy<cr>', { desc = 'open [L]azy' })
-- lazy update
set('n', '<leader>U', '<cmd>Lazy update<cr>', { desc = 'lazy [U]pdate' })
-- alpha
set({ 'n' }, '<leader>A', function() require('alpha').start(false) end, { desc = '[A]lpha' })
-- terminal
-- todo: review this terminal escape thing, flatten means no more nested terms so might be ok
set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'escape terminal mode' })
set({ 'n' }, '<leader>T', '<cmd>terminal<cr>', { desc = '[T]erminal' })
set({ 'n' }, '<leader>E', '<cmd>b term://<cr>', { desc = 'open [E]xisting terminal buffer' })
set({ 'n' }, '<leader>G', '<cmd>terminal tig<cr>', { desc = 'ti[G]' })
set({ 'n' }, '<leader>H', '<cmd>terminal htop<cr>', { desc = '[H]top' })

-- clx not installed rn
-- set({ 'n' }, '<leader>N', ':terminal clx<cr>', { desc = 'hacker [N]ews' })

-- todo: kinda weird binding see how it goes, should somehow be more fancy
set('n', '<leader><leader>', ':terminal ', { desc = 'run terminal command' })

-- following needs to be set in plugin config in this weird format to facilitate lazy loading
--- debug
set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = 'toggle [b]reakpoint' })
set('n', '<leader>dn', function() require('dap').continue() end, { desc = '[n]ew session' })

--- git
-- navigation
set('n', ']g', function() require('gitsigns').nav_hunk 'next' end, { desc = 'next git hunk' })
set('n', '[g', function() require('gitsigns').nav_hunk 'prev' end, { desc = 'previous git hunk' })
-- text object
set({ 'o', 'x' }, 'ih', function() require('gitsigns').select_hunk() end, { desc = 'inner hunk' })
-- diff
set('n', '<leader>gd', function() require('gitsigns').preview_hunk() end, { desc = '[d]iff hunk' })
-- blame
set('n', '<leader>gb', function() require('gitsigns').toggle_current_line_blame() end, { desc = '[b]lame' })
-- stage
set('n', '<leader>gs', function() require('gitsigns').stage_hunk() end, { desc = '[s]tage hunk' })
set('v', '<leader>gs', function() require('gitsigns').stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[s]tage visual selection' })
set('n', '<leader>gS', function() require('gitsigns').stage_buffer() end, { desc = '[S]tage buffer' })
-- unstage
set('n', '<leader>gu', function() require('gitsigns').undo_stage_hunk() end, { desc = '[u]nstage hunk' })
set('v', '<leader>gu', function() require('gitsigns').undo_stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[u]nstage visual selection' })
-- reset
set('n', '<leader>gr', function() require('gitsigns').reset_hunk() end, { desc = '[r]eset hunk' })
set('v', '<leader>gr', function() require('gitsigns').reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[r]eset visual selection' })
set('n', '<leader>gR', function() require('gitsigns').reset_buffer() end, { desc = '[R]eset buffer' })
set('n', '<leader>gt', function() require('gitsigns').toggle_signs() end, { desc = '[t]oggle signs' })

