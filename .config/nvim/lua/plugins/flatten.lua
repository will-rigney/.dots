--- flatten.nvim
-- open nvim from inside terminals opens buffers in parent

return {
	'willothy/flatten.nvim',
	config = true,
	-- ensure that it runs first to minimize delay when opening file from terminal
	lazy = false,
	priority = 1001,
}
