-- confirm-quit
-- always prompt to close neovim to avoid unloading language servers / be more emacs like

-- this doesn't seem to work with default Z bindings, works fine with `Z` to write
return {
	'yutkat/confirm-quit.nvim',
	-- don't load lazy
	-- event = 'CmdlineEnter',
	opts = {},
}
