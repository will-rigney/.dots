---------------------------------
---- will rigney nvim config ----
---------------------------------
-- remember to use :h for help text on any option
-- vim.opt: behaves like :set
-- vim.opt_global: behaves like :setglobal
-- vim.opt_local: behaves like :setlocal

--- general editor settings ---

-- line numbers
vim.opt.number = true								-- show line numbers
vim.opt.relativenumber = true						-- relative line numbers 

-- clipboard
vim.opt.clipboard = unnamedplus						-- yank to system clipboard

-- search
vim.opt.ignorecase = true							-- ignore case in search
vim.opt.smartcase = true							-- unless /C or captital in search

-- indent
vim.opt.smartindent = true							-- insert indents automatically

-- undo
vim.opt.undofile = true								-- save undo history

-- tabs
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
vim.opt.completeopt = {'menu','menuone','noselect'}	-- show menu for one match, don't insert until selected

-- window
vim.opt.title = true								-- enable window decoration title
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'							-- always display sign column

-- wrap
vim.opt.wrap = false 								-- disable wrapping

-- saving
vim.opt.updatetime = 250							-- decrease update time for swap files
-- todo: potentially no swap?
vim.opt.hidden = true								-- don't save when switching buffers

-- colours
vim.cmd "colorscheme habamax"						-- set colour scheme
vim.opt.colorcolumn = '80'							-- superior 80 column marker
-- vim.opt.termguicolors = true						-- true colour support (who needs this)

-- motion behaviour
vim.opt.iskeyword:remove '_' 						-- word motion doesn't skip _

-- netrw
vim.g.netrw_banner = 0								-- hide banner
vim.g.netrw_liststyle = 3							-- use tree display
vim.g.netrw_browse_split = 0 						-- open in current split
vim.g.netrw_altv = 1								-- todo
vim.g.netrw_preview = 1  							-- vertical preview
-- vim.g.netrw_winsize = 25							-- max 25%
-- vim.g.netrw_menu

--- env
vim.env.BASH_ENV = "$HOME/.bashrc"					-- use env in vim env (needed?)

-- filetype detection
vim.cmd "filetype plugin indent on"					-- enables plugin & indent files

--- modules
require 'statusline'
require 'keybinds'

-- automatically show all diagnostics on the current line in a floating window.
-- todo: figure out lsp support
-- i like this autocmd CursorHold
-- vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float()') 

--- todos
-- - markdown, txt, data files should have better wrapping behaviour
-- - have bindings for vimgrep
-- - delete trailing whitespace on save
