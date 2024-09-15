-- builtin diagnostic configuration

-- configure diagnostic appearance
local severity = vim.diagnostic.severity

-- lsp diagnostic display options
vim.diagnostic.config {
	signs = {
		-- always use * in sign column
		text = {
			[severity.ERROR] = '*',
			[severity.WARN] = '*',
			[severity.INFO] = '*',
			[severity.HINT] = '*',
		},
	},
	-- sort display by severity
	severity_sort = true,

	-- underline
	-- underline = false,
	underline = {
		-- only underline errors (less obtrusive)
		severity = severity.ERROR
	},
	-- to disable:
	-- virtual_text = false

	-- ideal world we want to show virtual text for full width window and not otherwise
	virtual_text = {
		severity = severity.ERROR,
		-- virt_text_hide = true,
		-- filter text
		format = function(diagnostic)
			-- always just the first line
			return diagnostic.message:gmatch '[^\r\n]+'()
		end,
		-- no prefix icon (a tab)
		prefix = '\t',
		-- don't show diagnostic source (clutter)
		source = false,
		-- todo: right_align not working correctly, covers text instead of wrapping or hiding
		-- virt_text_pos = 'right_align',
	},
}
