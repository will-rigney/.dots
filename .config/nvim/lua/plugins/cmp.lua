return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		priority = 100,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
		},
		config = function()
			-- require "custom.snippets"

			--vim.opt.completeopt = { "menu", "menuone", "noselect" }
			-- todo: what is shortmess?
		--  don't give |ins-completion-menu| messages; for		*shm-c*
		-- example, "-- XXX completion (YYY)", "match 1 of 2", "The only
		-- match", "Pattern not found", "Back at original", etc.
			-- vim.opt.shortmess:append "c"

			local cmp = require "cmp"

			cmp.setup {
				sources = {
					{ name = "nvim_lsp" },
					{ name = "cody" },
					{ name = "path" },
					{ name = "buffer" },
				},
				mapping = {
					-- not sure about this mapping? I like control space normally but happy to try
					["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
					["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
					-- should probably be enter if the window is open
					-- with recursive map
					["<C-y>"] = cmp.mapping( -- <C-y> to insert?
						cmp.mapping.confirm {
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						},
						{ "i", "c" }
					),
				},

				-- Enable luasnip to handle snippet expansion for nvim-cmp
				-- i don't use snippets
				-- snippet = {
				-- 	expand = function(args)
				-- 		vim.snippet.expand(args.body)
				-- 	end,
				-- },
			}

			-- Setup up vim-dadbod
			-- cmp.setup.filetype({ "sql" }, {
			-- 	sources = {
			-- 		{ name = "vim-dadbod-completion" },
			-- 		{ name = "buffer" },
			-- 	},
			-- })
		end,
	},
}
