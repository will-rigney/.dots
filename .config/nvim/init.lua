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

--- modules
require 'options'
require 'statusline'
require 'keybinds'
require 'netrw'
require 'lazyinit'

--- todos
-- - markdown, txt, data files should have better wrapping behaviour
--   - filetype plugin
-- - have bindings for vimgrep
-- - delete trailing whitespace on save / format on save
