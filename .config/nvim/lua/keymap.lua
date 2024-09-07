----------------
--- keybinds ---
----------------

-- vim users really have to gall to say emacs pinky
-- todo: figure out how to remove so much dependence on control key, maybe bind capslock held to control pressed to escape (seems like some nerd brittleness)

local set = vim.keymap.set

-- setup groups for which key
local wk = require "which-key"
wk.add({
	{ "<leader>b", group = "+buffer" },
	{ "<leader>c", group = "+code" },
	{ "<leader>d", group = "+debug" },
	{ "<leader>f", group = "+find" },
	{ "<leader>r", group = "+reload" },
	{ "<leader>t", group = "+tab" },
	{ "<leader>",  group = "+leader" },
	{ "<leader>g", group = "+git" },
	{ "[",         group = "+jump previous" },
	{ "]",         group = "+jump next" },
	{ "g",         group = "+mystic g" },
	{ "z",         group = "+folds+scrolls" },
})

-- add Z options
set("n", 'Zz', '<cmd>write<cr>', { desc = "write buffer" })
wk.add({
	{ "Z",  group = "quit" },
	{ "ZZ", desc = "save and quit buffer" },
	{ "ZQ", desc = "quit buffer without saving" },
})
set("n", '<leader>?', function() wk.show { global = true } end, { desc = "show buffer local keymaps" })

-- todo: remove <C-w> group
-- window
set('n', '<leader>w', '<C-w>')
wk.add({
	-- { "<leader>w",  proxy - "<c-w>", group = "windows" },
	-- how do I hide these mappings?
	-- { "<C-w>d",     hidden = true },
	-- { "<C-w><C-d>", hidden = true },

	{ "<leader>w",  group = "window" },
	{ "<leader>w+", desc = "increase height" },
	{ "<leader>w-", desc = "decrease height" },
	{ "<leader>w<", desc = "decrease width" },
	{ "<leader>w=", desc = "equally high and wide" },
	{ "<leader>w>", desc = "increase width" },
	{ "<leader>wT", desc = "break out into a new tab" },
	{ "<leader>w_", desc = "max out the height" },
	{ "<leader>wh", desc = "go to the left window" },
	{ "<leader>wj", desc = "go to the down window" },
	{ "<leader>wk", desc = "go to the up window" },
	{ "<leader>wl", desc = "go to the right window" },
	{ "<leader>wo", desc = "close all other windows" },
	{ "<leader>wq", desc = "quit a window" },
	{ "<leader>ws", desc = "split window" },
	{ "<leader>wv", desc = "split window vertically" },
	{ "<leader>ww", desc = "switch windows" },
	{ "<leader>wx", desc = "swap current with next" },
	{ "<leader>w|", desc = "max out the width" },
})

-- todo: don't close window when we delete a buffer, move to next buffer in same window
-- todo: same with tabs, dont close when deleting buffers

-- clear search highlights with escape
set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = "clear search highlight" })

-- main navigation keys (todo: hydra mode)
-- bit experimental
set('n', '<leader>h', '<cmd>tabprevious<cr>')
set('n', '<leader>l', '<cmd>tabnext<cr>')
set('n', '<leader>j', '<cmd>bprevious<cr>')
set('n', '<leader>k', '<cmd>bnext<cr>')

-- buffer
set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = "[b]uffer [d]elete" })
set('n', '<leader>bk', '<cmd>bdelete!<cr>', { desc = "[b]uffer [k]ill (warning: save first)" })
set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = "[b]uffer [n]ext" })
set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = "[b]uffer [p]revious" })
set('n', '<leader>bc', '<cmd>enew<cr>', { desc = "[b]uffer [c]reate" })

-- tab
set('n', '<leader>th', '<cmd>tabprevious<cr>')
set('n', '<leader>tl', '<cmd>tabnext<cr>')
set('n', '<leader>td', '<cmd>tabclose<cr>', { desc = "[t]ab [d]elete" })
set('n', '<leader>tn', '<cmd>tabnext<cr>', { desc = "[t]ab [n]ext" })
set('n', '<leader>tp', '<cmd>tabprevious<cr>', { desc = "[t]ab [p]revious" })
set('n', '<leader>tc', '<cmd>tabnew<cr>', { desc = "[t]ab [c]reate" })

-- mystic g
set('n', 'gd', vim.lsp.buf.definition, { desc = "[g]o to [d]efinition" })
set('n', 'gD', vim.lsp.buf.declaration, { desc = "[g]o to [D]eclaration" })
set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0, desc = "[g]o to [T]ype definition" }) -- why is buffer needed?
set("n", "gi", vim.lsp.buf.implementation, { desc = "[g]o to [T]ype definition" })

-- code
-- todo: scroll hover display & q to close, everything except q closes currently
set("n", "K", vim.lsp.buf.hover, { desc = "hover lsp documentation" })
set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "[c]ode switch source [h]eader" })
set("n", "<leader>cc", "<cmd>CompilerRedo<cr>", { desc = "[c]ode redo [c]ompile", silent = true })
set("n", "<leader>cC", "<cmd>CompilerOpen<cr>", { desc = "[c]ode choose [C]ompile option" })
-- todo: remove this binding replace with autoclosing on successful compile
set("n", "<leader>cR", "<cmd>CompilerToggleResults<cr>", { desc = "[c]ode toggle compiler [R]esults" })
set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[c]ode [r]ename" })
set('n', '<leader>cd', vim.diagnostic.open_float, { desc = "[c]ode show [d]iagnostic" }) -- todo: maybe an autocmd instead
set('n', '<leader>cL', '<cmd>LspInfo<cr>', { desc = "[c]ode [L]SP info" })

local conform = require'conform'
set({ 'n', 'v' }, '<leader>cf', conform.format, { desc = "[c]ode [f]ormat" })

-- todo: conform / autoformat is causing issues, revisit later
-- map({ 'n', 'v' }, '<leader>cf', function() require("conform").format() end)

-- telescope builtin mappings
local builtin = require('telescope.builtin')
-- todo: this should sort results by line number
set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "fuzzy search current buffer" })
set("n", "<leader>:", builtin.commands, { desc = "fuzzy run command" })
set("n", "<leader>C", function() builtin.colorscheme({ enable_preview = true }) end, { desc = "[C]olour schemes" })
-- find
-- set('n', '<leader>ff', builtin.find_files, { desc = "[f]ind [f]ile" })
set('n', '<leader>ff', builtin.fd, { desc = "[f]ind [f]ile" })
set('n', '<leader>fF', function() builtin.find_files { hidden = true } end, { desc = "[f]ind hidden [F]ile" })
set('n', '<leader>fg', builtin.live_grep, { desc = "[f]ind [g]rep" })
set('n', '<leader>fb', builtin.buffers, { desc = "[f]ind [b]uffer" })
set('n', '<leader>fh', builtin.help_tags, { desc = "[f]ind [h]elp" })
set("n", "<leader>fs", builtin.grep_string, { desc = "[f]ind [s]tring" })
set("n", "<leader>fm", builtin.man_pages, { desc = "[f]ind [m]an page" })
-- this will checkout the chosen commit on <cr>
set('n', '<leader>fc', builtin.git_bcommits, { desc = "[f]ind buffer [c]ommits" })
set('n', '<leader>fC', builtin.git_commits, { desc = "[f]ind directory [C]ommits" })
set("n", "<leader>fD", builtin.git_status, { desc = "[f]ind git [D]iff" }) -- maybe different bind... -- very powerful for searching diffs
set("n", "<leader>fG", builtin.git_files, { desc = "[f]ind [G]it files" })

-- find with lsp
set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "[f]ind document [s]ymbols" })
set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "[f]ind workspace [S]ymbols" }) -- weirdly only has types, at least in rust-analyzer
set("n", "<leader>fr", builtin.lsp_references, { desc = "[f]ind [r]eferences" })
set("n", "<leader>fi", builtin.lsp_implementations, { desc = "[f]ind [i]mplementations" })
set("n", "<leader>fd", builtin.diagnostics, { desc = "[f]ind [d]iagnostics" })

set("n", "<leader>fR", builtin.oldfiles, { desc = "[f]ind [R]eopen" })

-- reload config files
set('n', '<leader>rc', '<cmd>source $HOME/.config/nvim/init.lua<cr>', { desc = "[r]eload [c]onfig" })               -- init.lua
set('n', '<leader>rk', '<cmd>source $HOME/.config/nvim/lua/keymap.lua<cr>', { desc = "[r]eload [k]eymap" })         -- keybinds
set('n', '<leader>rl', '<cmd>source $HOME/.config/nvim/lua/statusline.lua<cr>', { desc = "[r]eload [s]tatusline" }) -- statusline

-- open lazy
set('n', '<leader>L', '<cmd>Lazy<cr>', { desc = "open [L]azy" })

-- terminal
set({ "n" }, '<leader>T', ':terminal<cr>', { desc = "open [T]erminal" }) -- open terminal
set({ "n" }, '<leader>G', ':terminal tig<cr>', { desc = "open ti[G]" })  -- open terminal
set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "escape terminal mode" }) -- escape from terminal


-- debug
local dap = require "dap"
set("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle [d]ebug [b]reakpoint" })
set("n", "<leader>dn", "<cmd>DapNew<cr>", { desc = "[d]ebug [n]ew session" })

set("n", "<F1>", dap.continue)
-- vim.keymap.set("n", "<F1>", dap.pause) -- no bind for pause currently
set("n", "<F2>", dap.step_into)
set("n", "<F3>", dap.step_over)
set("n", "<F4>", dap.step_out)
set("n", "<F5>", dap.step_back)
set("n", "<F6>", dap.restart)
set("n", "<F7>", dap.stop) -- dap.stop & dap.close both don't seem to do anything
set("n", "<F8>", dap.disconnect)

-- note that nvim-dap is generally compatible with .vscode/launch.json config files

-- git
local gitsigns = require "gitsigns"
-- navigation
set('n', ']h', function() gitsigns.nav_hunk('next') end, { desc = "next hunk" })
set('n', '[h', function() gitsigns.nav_hunk('prev') end, { desc = "previous hunk" })
-- text object
set({ 'o', 'x' }, 'ih', '<cmd>gitsigns select_hunk<CR>', { desc = "inner hunk" })
-- diff
set('n', '<leader>gd', gitsigns.diffthis, { desc = "[g]it [d]iff" })
-- blame
set('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = "[g]it [b]lame" })
-- stage
set('n', '<leader>gs', gitsigns.stage_hunk, { desc = "[g]it [s]tage hunk" })
set('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
	{ desc = "[g]it [s]tage [h]unk" })
set('n', '<leader>gS', gitsigns.stage_buffer, { desc = "[g]it [S]tage buffer" })
-- unstage
set('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = "[g]it [u]nstage hunk" })
set('v', '<leader>gu', function() gitsigns.undo_stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
	{ desc = "[g]it [u]nstage [h]unk" })
-- reset
set('n', '<leader>gr', gitsigns.reset_hunk, { desc = "[g]it [r]eset hunk" })
set('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
set('n', '<leader>gR', gitsigns.reset_buffer, { desc = "[g]it [R]eset buffer" })
set('n', '<leader>gt', gitsigns.toggle_signs, { desc = "[g]it [t]oggle signs" })

-- todo: stage line would be nice (like in tig)
-- oil vinegar bind
set("n", "-", "<cmd>Oil<cr>", { desc = "open parent directory" })
