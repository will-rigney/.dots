-- luasnip snippet engine
-- needed to autocomplete function arguments

-- snippets not expanding from cmp quite yet
return {
	'L3MON4D3/LuaSnip',
	-- follow latest release.
	lazy = true,
	version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = 'make install_jsregexp',
}
