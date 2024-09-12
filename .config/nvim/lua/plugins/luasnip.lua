-- luasnip snippet engine
-- needed to autocomplete function arguments

return {
	'L3MON4D3/LuaSnip',
	-- lazy (with cmp)
	lazy = true,
	-- follow latest release.
	version = 'v2.*',
	-- install jsregexp (optional)
	build = 'make install_jsregexp',
}
