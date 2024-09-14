---------------
--- options ---
---------------

-- vim.opt: behaves like :set
-- vim.opt_global: behaves like :setglobal
-- vim.opt_local: behaves like :setlocal

vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- relative line numbers

-- clipboard
-- vim.opt.clipboard = "unnamedplus"				-- yank to system clipboard
-- vim.opt.clipboard = "unnamed"						-- yank to system clipboard
-- can't use unnamedplus due to odd bug with gnome & netrw

-- searchoptions
vim.opt.ignorecase = true -- ignore case in search
vim.opt.smartcase = true -- unless /C or capital in search

-- indent
vim.opt.smartindent = true -- insert indents automatically

-- undo
vim.opt.undofile = true -- save undo history

-- tabs
-- defaults, override per filetype with ftplugin
vim.opt.tabstop = 4 -- use hard tabs width 4
vim.opt.softtabstop = 0 -- disable soft tab stop
vim.opt.shiftwidth = 4 -- shift same as tab width

-- scroll
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 12
-- see also: neoscroll plugin

-- completion
vim.opt.wildmode = { 'list', 'longest' } -- list matches until longest common string
vim.opt.wildoptions = { 'pum' } -- popup menu
vim.opt.inccommand = 'nosplit' -- incremental completion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert', 'popup' } -- show menu for one match, don't insert until selected

-- window
vim.opt.title = true -- enable window decoration title
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes' -- always display sign column
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt_global.showcmd = false -- don't show key just pressed (flashing hjkl in bottom corner)

-- vim.opt.colorcolumn = '80' -- superior 80 column marker (not enabled)
-- todo: override per filetype, keybind to toggle

-- wrap
vim.opt.linebreak = true -- break on word boundary, see breakat string
vim.opt.wrap = false -- disable wrapping (override per ft)

-- saving
vim.opt.updatetime = 1000 -- decrease update time for swap files
vim.opt.hidden = true -- don't save when switching buffers
vim.opt.confirm = true

-- treesitter doesn't highlight regular terminal colours correctly
vim.opt.termguicolors = true -- enable true colour support
-- vim.opt.termguicolors = false -- disable true colour support
-- todo: why does editing text need true colour support

-- disable neovide cursor animations:
vim.g.neovide_cursor_animation_length = 0

-- netrw (not in use)
vim.g.netrw_banner = 0								-- hide banner
vim.g.netrw_liststyle = 3							-- use tree display
vim.g.netrw_browse_split = 0 						-- open in current split
vim.g.netrw_altv = 1								-- todo
vim.g.netrw_preview = 1  							-- vertical preview
