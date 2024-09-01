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
set("n", '<leader>?', function() wk.show { global = true } end, { desc = "show buffer local keymaps" })

-- window
-- todo: think there's a hallowed way to do this rebind involving which-key
set('n', '<leader>w', '<C-w>')

-- clear search highlights with escape
set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = "clear search highlight" })

-- buffer
set('n', '<leader>bl', '<cmd>buffers<cr>', { desc = "[b]uffer [l]ist" }) -- todo: not needed with telescope find buffer
set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = "[b]uffer [d]elete" })
set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = "[b]uffer [n]ext" })
set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = "[b]uffer [p]revious" })
set('n', '<leader>bc', '<cmd>enew<cr>', { desc = "[b]uffer [c]reate" })

-- tab
set('n', '<leader>tl', '<cmd>tabs<cr>', { desc = "[t]ab [l]ist" })
set('n', '<leader>td', '<cmd>tabclose<cr>', { desc = "[t]ab [d]elete" })
set('n', '<leader>tn', '<cmd>tabnext<cr>', { desc = "[t]ab [n]ext" })
set('n', '<leader>tp', '<cmd>tabprevious<cr>', { desc = "[t]ab [p]revious" })
set('n', '<leader>tc', '<cmd>tabnew<cr>', { desc = "[t]ab [c]reate" })
-- use hjkl for tab navigation

-- mystic g
set('n', 'gd', vim.lsp.buf.definition, { desc = "[g]o to [d]efinition" })
set('n', 'gD', vim.lsp.buf.declaration, { desc = "[g]o to [D]eclaration" })
set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0, desc = "[g]o to [T]ype definition" }) -- why is buffer needed?
set("n", "gi", vim.lsp.buf.implementation, { desc = "[g]o to [T]ype definition" })

-- code
-- todo: scroll hover display & q to close, everything except q closes currently
set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "open lsp documentation hover popup" }) -- todo: better desc for this
set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "[c]ode switch source [h]eader" })
set("n", "<leader>cc", "<cmd>CompilerRedo<cr>", { desc = "[c]ode redo [c]ompile" })
set("n", "<leader>cC", "<cmd>CompilerOpen<cr>", { desc = "[c]ode choose [C]ompile option" })
-- todo: remove this binding replace with autoclosing on successful compile
set("n", "<leader>cR", "<cmd>CompilerToggleResults<cr>", { desc = "[c]ode toggle compiler [r]esults" })
set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0, desc = "[c]ode [r]ename" })     -- todo: does this not rename through workspace?
set({ 'n', 'v' }, '<leader>cf', vim.lsp.buf.format, { desc = "[c]ode [f]ormat" })
set('n', '<leader>cd', vim.diagnostic.open_float, { desc = "[c]ode show [d]iagnostic" }) -- todo: maybe an autocmd instead
set('n', '<leader>cL', '<cmd>LspInfo<cr>', { desc = "[c]ode [L]SP info" })

-- todo: conform / autoformat is causing issues, revisit later
-- map({ 'n', 'v' }, '<leader>cf', function() require("conform").format() end)

-- maybe change this
set('n', '<leader>n', '<cmd>Explore<cr>', { desc = "open [n]etrw" }) -- open netrw tree
-- <C-w> h returns to already open netrw window

-- telescope builtin mappings
local builtin = require('telescope.builtin')
-- todo: this should sort results by line number
set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "fuzzy search current buffer" })
set("n", "<leader>C", function() builtin.colorscheme({ enable_preview = true }) end, { desc = "[C]olour schemes" })
-- find
-- todo: show hidden files not including .git directory
set("n", "<leader>f:", builtin.commands, { desc = "[f]ind commands" })
set('n', '<leader>ff', function() builtin.find_files { hidden = true } end, { desc = "[f]ind [f]file" })
set('n', '<leader>fg', builtin.live_grep, { desc = "[f]ind [g]rep" })
set('n', '<leader>fb', builtin.buffers, { desc = "[f]ind [b]uffer" })
set('n', '<leader>fh', builtin.help_tags, { desc = "[f]ind [h]elp" })
set("n", "<leader>fs", builtin.grep_string, { desc = "[f]ind [s]tring" })
set("n", "<leader>fm", builtin.man_pages, { desc = "[f]ind [m]an page" })
-- this will checkout the chosen commit on <cr>
set('n', '<leader>fc', builtin.git_bcommits, { desc = "[f]ind buffer [c]ommits" })
set('n', '<leader>fC', builtin.git_commits, { desc = "[f]ind directory [C]ommits" })
set("n", "<leader>fD", builtin.git_status, { desc = "[f]ind git [D]iff" }) -- maybe different bind... -- very powerful for searching diffs

-- find with lsp
set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "[f]ind document [s]ymbols" })
set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "[f]ind workspace [S]ymbols" }) -- weirdly only has types, at least in rust-analyzer
set("n", "<leader>fr", builtin.lsp_references, { desc = "[f]ind [r]eferences" })
set("n", "<leader>fi", builtin.lsp_implementations, { desc = "[f]ind [i]mplementations" })
set("n", "<leader>fd", builtin.diagnostics, { desc = "[f]ind [d]iagnostics" })

-- reload config files
set('n', '<leader>rc', '<cmd>source $HOME/.config/nvim/init.lua<cr>', { desc = "[r]eload [c]onfig" })               -- init.lua
set('n', '<leader>rk', '<cmd>source $HOME/.config/nvim/lua/keymap.lua<cr>', { desc = "[r]eload [k]eymap" })         -- keybinds
set('n', '<leader>rl', '<cmd>source $HOME/.config/nvim/lua/statusline.lua<cr>', { desc = "[r]eload [s]tatusline" }) -- statusline

-- open lazy
set('n', '<leader>L', '<cmd>Lazy<cr>', { desc = "open [L]azy" })

-- terminal
-- todo: why visual mode as well?
set({ "n", "v" }, '<leader>T', ':terminal<cr>', { desc = "open [T]erminal" }) -- open terminal
-- todo: open terminal and enter insert mode at the prompt

set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "escape terminal mode" }) -- escape from terminal
-- todo: bdelete should kill terminal process, e.g. bdelete! from terminal

-- debug
local dap = require "dap"
local dapui = require "dapui"
set("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle [d]ebug [b]reakpoint" })
set("n", "<leader>dn", "<cmd>DapNew<cr>", { desc = "[d]ebug [n]ew session" })
set({ "n", "v" }, "<leader>de", dapui.eval, { desc = "[d]ebug [e]valuate expression" }) -- needs active session

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
set('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = "[g]it [b]lame toggle" })
-- stage
set('n', '<leader>gs', gitsigns.stage_hunk, { desc = "[g]it [s]tage [h]unk" })
set('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
	{ desc = "[g]it [s]tage [h]unk" })
set('n', '<leader>gS', gitsigns.stage_buffer, { desc = "[g]it [s]tage [b]uffer" })
-- unstage
set('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = "[g]it [u]nstage hunk" })
set('v', '<leader>gu', function() gitsigns.undo_stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
	{ desc = "[g]it [u]nstage [h]unk" })
-- reset
set('n', '<leader>gr', gitsigns.reset_hunk, { desc = "[g]it [r]eset [h]unk" })
set('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
set('n', '<leader>gR', gitsigns.reset_buffer, { desc = "[g]it [r]eset [b]uffer" })

-- todo: stage line would be nice (like in tig)
