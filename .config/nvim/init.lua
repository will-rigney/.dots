---------------------------------
---- will rigney nvim config ----
---------------------------------

-- remember to use :h for help text on any option

-- env
vim.env.BASH_ENV = "$HOME/.bashrc"					-- use env in vim env (needed?)
-- i don't think i even use .bashrc for env

-- colours
vim.cmd "colorscheme habamax"						-- set colour scheme

-- filetype
vim.cmd "filetype plugin indent on"					-- enables plugin & indent files

-- map leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--- modules
require 'options'
require 'lazyinit' -- todo: maybe fold into init file
require 'statusline'
require 'keymap'
require 'netrw'
