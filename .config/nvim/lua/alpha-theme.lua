-----------------
-- alpha theme --
-----------------

-- only want to open for empty buffer

-- todo: where is this used? & why
local if_nil = vim.F.if_nil

local default_header = {
	type = 'text',
	val = {
		[[       ,                              ]],
		[[       \`-._           __             ]],
		[[        \\  \-..____,.'  `.           ]],
		[[         :  )       :      :\         ]],
		[[          ;'        '   ;  | :        ]],
		[[          )..      .. .:.`.; :        ]],
		[[         /::...  .:::...   ` ;        ]],
		[[         `:o>   /\o_>        : `.     ]],
		[[        `-`.__ ;   __..--- /:.   \    ]],
		[[        === \_/   ;=====_.':.     ;   ]],
		[[         ,/'`--'...`--....        ;   ]],
		[[              ;                    ;  ]],
		[[          . '                       ; ]],
		[[        .'     ..     ,      .       ;]],
		[[       :       ::..  /      ;::.     |]],
		[[      /      `.;::.  |       ;:..    ;]],
		[[     :         |:.   :       ;:.    ; ]],
		[[     :         ::     ;:..   |.    ;  ]],
		[[      :       :;      :::....|     |  ]],
		[[      /\     ,/ \      ;:::::;     ;  ]],
		[[    .:. \:..|    :     ; '.--|     ;  ]],
		[[   ::.  :''  `-.,,;     ;'   ;     ;  ]],
		[[.-'. _.'\      / `;      \,__:      \ ]],
		[[`---'    `----'   ;      /    \,.,,,/ ]],
		[[                   `----`             ]],
		[[                                      ]],
	},
	opts = {
		hl = 'Type',
		shrink_margin = false,
	},
}

local leader = '<leader>'

-- todo: should take same type for keybind as actual keymap function does

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
	--
	local sc_ = sc:gsub('%s', ''):gsub(leader, '<leader>')
	-- button display opts
	local opts = {
		position = 'left',
		shortcut = '[' .. sc .. '] ',
		cursor = 1,
		-- width = 50,
		align_shortcut = 'left',
		hl_shortcut = { { 'Operator', 0, 1 }, { 'Number', 1, #sc + 1 }, { 'Operator', #sc + 1, #sc + 2 } },
		shrink_margin = false,
	}
	-- add the keybind if one passed
	if keybind then
		keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { 'n', sc_, keybind, keybind_opts }
	end

	-- on press key code
	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
		vim.api.nvim_feedkeys(key, 't', false)
	end

	-- returns a little button structure with passed values
	-- this is the actual member of the layout tree
	return {
		type = 'button',
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

-- todo: want to add little cowsay section

local section = {
	header = default_header,
	-- the good items here
	-- want list of recent working directories basically
	-- string = 
	top_buttons = {
		type = 'group',
		val = {
			button('c', 'create new file', '<cmd>ene <cr>'),
			button('r', 'recent files', '<cmd>lua require"telescope.builtin".oldfiles()<cr>'),
			button('f', 'find files', '<cmd>lua require"telescope.builtin".fd()<cr>'),
			button('-', 'parent directory', '<cmd>lua require("oil").open()<cr>'),
		},
	},
	bottom_buttons = {
		type = 'group',
		val = {
			button('q', 'quit', '<cmd>q <CR>'),
		},
	},
	footer = {
		type = 'group',
		val = {},
	},
}

local config = {
	-- layout is odd to have member of config
	-- and refer to each part individually
	layout = {
		{ type = 'padding', val = 1 },
		section.header,
		{ type = 'padding', val = 2 },
		section.top_buttons,
		{ type = 'padding', val = 1 },
		section.bottom_buttons,
		section.footer,
	},
	opts = {
		margin = 3,
		redraw_on_resize = false,
	},
}

return {
	button = button,
	section = section,
	config = config,
	-- theme config
	leader = leader,
	-- whats going on here, whats mean 'deprecated'
	-- deprecated
	opts = config,
}
