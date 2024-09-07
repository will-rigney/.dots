---------------
--- options ---
---------------

-- vim.opt: behaves like :set
-- vim.opt_global: behaves like :setglobal
-- vim.opt_local: behaves like :setlocal

vim.opt.number = true         -- show line numbers
vim.opt.relativenumber = true -- relative line numbers

-- clipboard
-- vim.opt.clipboard = "unnamedplus"				-- yank to system clipboard
-- vim.opt.clipboard = "unnamed"						-- yank to system clipboard
-- can't use unnamedplus due to odd bug with gnome & netrw

-- searchopti
vim.opt.ignorecase = true -- ignore case in search
vim.opt.smartcase = true  -- unless /C or captital in search

-- indent
vim.opt.smartindent = true -- insert indents automatically

-- undo
vim.opt.undofile = true -- save undo history

-- tabs
-- defaults, override per filetype with ftplugin
vim.opt.tabstop = 8     -- use hard tabs width 4
vim.opt.softtabstop = 0 -- disable soft tab stop
vim.opt.shiftwidth = 8  -- shift same as tab width

-- scroll
vim.opt.scrolloff = 8     -- scroll 8 lines from bottom
vim.opt.sidescrolloff = 8 -- scroll 8 columns from right

-- completion
vim.opt.wildmode = { 'list', 'longest' }                                     -- list matches until longest common string
vim.opt.wildoptions = { "pum" }                                              -- popup menu
vim.opt.inccommand = 'nosplit'                                               -- incremental completion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert', 'popup' } -- show menu for one match, don't insert until selected

-- window
vim.opt.title = true       -- enable window decoration title
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes' -- always display sign column
vim.opt.splitbelow = true
vim.opt.splitright = true

-- vim.opt.colorcolumn = '80' -- superior 80 column marker

-- wrap
vim.opt.linebreak = true -- break on word boundary, see breakat string
vim.opt.wrap = false     -- disable wrapping

-- saving
vim.opt.updatetime = 1000    -- decrease update time for swap files
vim.opt.hidden = true        -- don't save when switching buffers

vim.opt.termguicolors = true -- true colour support
--
