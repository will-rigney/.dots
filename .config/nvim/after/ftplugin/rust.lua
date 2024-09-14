-- todo: editor config or rustfmt.toml to overwrite this

-- use rust recommended indentation
-- rust official style guide lists spaces but I prefer tabs

-- default rust ftplugin should do this anyway
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- auto format only if project has rustfmt.toml
vim.g.rustfmt_autosave_if_config_present = 1

-- braced blocks folded, all open by default
vim.g.rust_fold = 1
-- 1 Braced blocks are folded. All folds are open by default.
-- 2 Braced blocks are folded. 'foldlevel' is left at the global value (all folds are closed by default).
