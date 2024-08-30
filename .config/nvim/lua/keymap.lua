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
	{ "<leader>", group = "+leader" },
	{ "<leader>g", group = "+git" },
	{ "[", group = "+jump previous" },
	{ "]", group = "+jump next" },
	{ "g", group = "+mystic g" },
	{ "z", group = "+folds + scroll" },
})

-- clear search highlights with escape
-- todo: this mapping bit of a blunt instrument, reevalutate with some use
set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = "clear search highlight" })

-- buffer
set('n', '<leader>bl', '<cmd>buffers<cr>', { desc = "[b]uffer [l]ist" })
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

-- todo: buffer + tab binds need some thinking, maybe do verb then object

-- window
-- todo: think there's a hallowed way to do this rebind involving which-key
set('n', '<leader>w', '<C-w>', { desc = "[w]indow" })

-- mystic g
set('n', 'gd', vim.lsp.buf.definition, { desc = "[g]o to [d]efinition" })
set('n', 'gD', vim.lsp.buf.declaration, { desc = "[g]o to [D]eclaration" })
set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0, desc = "[g]o to [T]ype definition" })

-- code
set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "open lsp documentation hover popup" })      -- todo: better desc for this
-- todo: scroll hover display & q to close, everything except q closes currently

set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0, desc = "[c]ode [r]ename" }) -- todo: does this not rename through workspace?
-- todo: does format in visual mode just format selection?
set({ 'n', 'v' }, '<leader>cf', vim.lsp.buf.format, { desc = "[c]ode [f]ormat" })
set('n', '<leader>cL', '<cmd>LspInfo<cr>', { desc = "[c]ode [L]SP info" })

-- todo: conform / autoformat is causing issues, revisit later
-- map({ 'n', 'v' }, '<leader>cf', function() require("conform").format() end)

-- files (find?)
-- maybe change this
set('n', '<leader>n', '<cmd>Explore<cr>', { desc = "open [n]etrw" }) -- open netrw tree
-- <C-w> h returns to already open netrw window

-- find (telescope)
local builtin = require('telescope.builtin')
-- todo: this should show hidden files, not show .git and probably follow .gitignore
set('n', '<leader>ff', builtin.find_files, { desc = "[f]ind [f]file" })
set('n', '<leader>fg', builtin.live_grep, { desc = "[f]ind [g]rep" })
set('n', '<leader>fb', builtin.buffers, { desc = "[f]ind [b]uffer" })
set('n', '<leader>fh', builtin.help_tags, { desc = "[f]ind [h]elp" })
set("n", "<leader>fs", builtin.grep_string, { desc = "[f]ind [s]tring"})

-- think about this key
set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "fuzzy search current buffer" })

-- find with lsp
set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "[f]ind document [s]ymbols" })
set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "[f]ind workspace [S]ymbols" }) -- weirdly only has types, at least in rust-analyzer
set("n", "<leader>fr", builtin.lsp_references, { desc = "[f]ind [r]eferences" })
set("n", "<leader>fi", builtin.lsp_implementations, { desc = "[f]ind [i]mplementations" })
set("n", "<leader>fd", builtin.diagnostics, { desc = "[f]ind [d]iagnostics" })

-- reload config files
set('n', '<leader>rc', '<cmd>source ~/.config/nvim/init.lua<cr>', { desc = "[r]eload [c]onfig" })               -- init.lua
set('n', '<leader>rk', '<cmd>source ~/.config/nvim/lua/keymap.lua<cr>', { desc = "[r]eload [k]eymap" })         -- keybinds
set('n', '<leader>rl', '<cmd>source ~/.config/nvim/lua/statusline.lua<cr>', { desc = "[r]eload [s]tatusline" }) -- statusline

-- open lazy
set('n', '<leader>L', '<cmd>Lazy<cr>', { desc = "open [L]azy"} )

-- terminal
-- still on the fence about this vs regular terminal
-- set({ "n", "v" }, '<leader>t', ':terminal<cr>', { desc = "open [t]erminal" }) -- open terminal
-- todo: open terminal and enter insert mode at the prompt

set("t", "<esc><esc>", "<c-\\><c-n>") -- escape from terminal
-- todo: bdelete should kill terminal, e.g. bdelete! from terminal

-- debug
local dap = require "dap"
local dapui = require "dapui"
-- todo: dapui keymap controls (+ sane layout)
set("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle [d]ebug [b]reakpoint" })
set("n", "<leader>dn", "<cmd>DapNew<cr>", { desc = "[d]ebug [n]ew session" })
set({ "n", "v" }, "<leader>de", dapui.eval, { desc = "[d]ebug [e]valuate expression"})
-- note that apparently nvim-dap is compatible with .vscode/launch.json config files

-- git
local gitsigns = require "gitsigns"
-- add groups
wk.add({
	{ "<leader>gs", group = "+stage" },
	{ "<leader>gr", group = "+reset" },
})

-- todo: check do these work on just current buffer?
set('n', '<leader>gd', gitsigns.diffthis, { desc = "[g]it [d]iff"})
set('n', '<leader>gsh', gitsigns.stage_hunk, { desc = "[g]it [s]tage [h]unk"})
set('v', '<leader>gsh', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "[g]it [s]tage [h]unk"})
set('n', '<leader>gsb', gitsigns.stage_buffer, { desc =  "[g]it [s]tage [b]uffer" }) -- todo: stage file or something? git metaphor not vim metaphor
set('n', '<leader>grh', gitsigns.reset_hunk, { desc = "[g]it [r]eset [h]unk"})
set('v', '<leader>grh', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
set('n', '<leader>grb', gitsigns.reset_buffer, { desc = "[g]it [r]eset [b]uffer"})
set('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = "[g]it [b]lame toggle"}) -- this is cool
-- text object (untested)
set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
-- todo: stage line would be nice (like in tig)
