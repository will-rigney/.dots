-- numbers
vim.opt_local.relativenumber = false
vim.opt_local.number = false

-- no tressitter for man (bat in bash is better manpager anyway)
vim.cmd.syntax 'on'
vim.cmd.wincmd 'L'
-- todo: this should actually open in right split if one is open already (same as help should)

-- todo: also linebreaks + wrap
-- todo: potentially use terminal for manpages...
