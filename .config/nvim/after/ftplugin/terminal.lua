-- special terminal filetype to make terminal autocmd settings simpler

vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.opt_local.scrolloff = 0 -- not sure
vim.opt_local.signcolumn = 'no'

-- todo:
-- duh this is what's making it crazy
-- needs to be some sort of local if anything
-- vim.cmd [[set winhl=Normal:NormalFloat]] -- review this
