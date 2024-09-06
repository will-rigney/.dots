---------------------------------
---- will rigney nvim config ----
---------------------------------

-- remember to use :h for help text on any option

-- env
vim.env.BASH_ENV = "$HOME/.bashrc" -- use bash env in vim env (aliases etc)

-- filetype
vim.cmd "filetype plugin indent on" -- enables plugin & indent files

-- map leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
-- :checkhealth for more information

--- modules
require "options"
require "autocmd"
require "lazyinit"
require "statusline"
require "keymap"
