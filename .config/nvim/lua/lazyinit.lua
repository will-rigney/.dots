-- using lazy.nvim for plugin package management as it's the most ubiquitous
-- pls minimise number of packages to bare minimum
--
-- which key about to go soon

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  -- handle error
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy
-- todo: move to module per plugin, makes more explicit & maintainable
require("lazy").setup({
  spec = {
    { import = "plugins" },
	-- todo: maybe dap, automatic tabstop shift size, auto formatting
  },
  -- colorscheme that will be used when installing plugins
  install = { colorscheme = { "habamax" } }, -- todo: use a variable instead maybe?
  -- automatically check for plugin updates
  checker = { enabled = true },
})
