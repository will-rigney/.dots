------------------
--- statusline ---
------------------

-- very basic for now, probably fine like this

local function status_line()
	local file_name = "%-.16t" -- todo: how does this formatting work
	local buf_nr = "[%n]"
	local modified = " %-m"
	local file_type = " %y"
	local right_align = "%="
	local line_no = "%10([%l/%L%)]"
	local pct_thru_file = "%5p%%"

	return string.format(
		"%s%s%s%s%s%s%s",
		file_name,
		buf_nr,
		modified,
		file_type,
		right_align,
		line_no,
		pct_thru_file
	)
end

-- todo:
--  - show number of buffers?
--  - filename truncated too soon
--  - show mode in pretty colours or don't

vim.opt.statusline = status_line()
