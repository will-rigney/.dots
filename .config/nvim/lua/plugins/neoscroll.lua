-- neoscroll
-- smooth scrolling (makes c-u/c-d less disorienting)
-- this is pretty cursed tbh

return {
	'karb94/neoscroll.nvim',
	config = function()
		-- default values
		require('neoscroll').setup {
			-- mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
			-- rly?
			hide_cursor = true,
			--
			stop_eof = false,
			-- stop_eof = false, -- window stop scrolling so last line of file is last line of window
			--
			respect_scrolloff = true, -- default false, testing it out
			-- cursor keeps scrolling even if window can't
			cursor_scrolls_alone = false,
			-- cool
			easing = 'linear',
			-- easing functions:
			-- - linear (they forgot it)
			-- - quadratic
			-- - cubic
			-- - quartic
			-- - quintic
			-- - circular
			-- - sine
			pre_hook = nil,
			post_hook = nil,
			performance_mode = true,
			ignored_events = { 'WinScrolled', 'CursorMoved' },
		}
	end,
}
