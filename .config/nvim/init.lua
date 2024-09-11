---------------------------------
---- will rigney nvim config ----
---------------------------------

-- remember to use :h for help text on any option

-- filetype
-- todo: unclear whether indent files or lua files should be used for indent
vim.cmd 'filetype plugin on' -- enables plugin files only
-- vim.cmd 'filetype plugin indent on' -- enables plugin & indent files

-- disable providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
-- :checkhealth to confirm

-- map leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--- modules
require 'options'
require 'statusline'
require 'lazyinit'
require 'autocmd'
require 'keymap'

-- color scheme
-- default is best rn
vim.cmd 'colorscheme default'
-- slight edits
vim.cmd 'highlight WinSeparator guifg=Black'
vim.cmd 'highlight StatusLine guibg=Black guifg=NvimLightGray3'
vim.cmd 'highlight StatusLineNC guibg=NvimDarkGray3 guifg=NvimLightGray3'
