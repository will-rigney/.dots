---------------
--- options ---
---------------

-- vim.opt: behaves like :set
-- vim.opt_global: behaves like :setglobal
-- vim.opt_local: behaves like :setlocal

vim.opt.number = true								-- show line numbers
vim.opt.relativenumber = true						-- relative line numbers 

-- clipboard
-- vim.opt.clipboard = "unnamedplus"				-- yank to system clipboard
-- can't use unnamedplus due to odd bug with gnome & netrw
-- vim.opt.clipboard = "unnamed"						-- yank to system clipboard

-- searchopti
vim.opt.ignorecase = true							-- ignore case in search
vim.opt.smartcase = true							-- unless /C or captital in search

-- indent
vim.opt.smartindent = true							-- insert indents automatically

-- undo
vim.opt.undofile = true								-- save undo history

-- tabs
-- todo: override per filetype with filetype plugin
vim.opt.tabstop = 4									-- use hard tabs width 4
vim.opt.softtabstop = 0								-- disable soft tab stop
vim.opt.shiftwidth = 4								-- shift same as tab width

-- scroll
vim.opt.scrolloff = 8								-- scroll 8 lines from bottom
vim.opt.sidescrolloff = 8							-- scroll 8 columns from right

-- completion
vim.opt.wildmode = {'list', 'longest'}				-- list matches until longest common string
vim.opt.wildoptions = {"pum"}						--
vim.opt.inccommand = 'nosplit'						-- incremental completion
vim.opt.completeopt = {'menu','menuone','noselect', 'noinsert', 'popup' }	-- show menu for one match, don't insert until selected

-- window
vim.opt.title = true								-- enable window decoration title
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'							-- always display sign column
vim.opt.splitbelow = true
vim.opt.splitright = true

-- todo: temporary trying without this but its pretty essential normally
-- vim.opt.colorcolumn = '80'							-- superior 80 column marker

-- wrap
vim.opt.linebreak = true 								-- break on word boundary, see breakat string
vim.opt.wrap = false 								-- disable wrapping

-- saving
vim.opt.updatetime = 250							-- decrease update time for swap files
-- todo: potentially no swap file?
vim.opt.hidden = true								-- don't save when switching buffers

-- shared data file options
-- shared data vim.opt.shada = { "'10", "<0", "s10", "h" }

-- motion behaviour
vim.opt.iskeyword:remove '_' 						-- word motion doesn't skip _
vim.opt.termguicolors = true						-- true colour support (who needs this)

-- 