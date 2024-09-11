------------------
--- statusline ---
------------------

-- very basic, fine like this

-- todo: would like alpha buffer Scratch to have a different name

local function status_line()
	local file_name = '%-.32t'
	local modified = ' %-m'
	local file_type = ' %y'
	local right_align = '%='
	local line_no = '%10([%l/%L%)]'
	return string.format('  %s%s%s%s%s ', file_name, modified, file_type, right_align, line_no)
end

vim.opt.statusline = status_line()
