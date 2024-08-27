return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		priority = 100,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
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
					{ name = "nvim_lsp" }, -- lsp source
					{ name = "path" },
					{ name = "crates" },
				},
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
							-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
							-- they way you will only jump inside the snippet region
							-- elseif has_words_before() then
							--   cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" })
					-- not sure about this mapping? I like control space normally but happy to try
					-- ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
					-- ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
					-- default is tab
					-- should probably be enter if the window is open
					-- with recursive map
					-- ["<C-y>"] = cmp.mapping( -- <C-y> to insert?
					-- 	cmp.mapping.confirm {
					-- 		behavior = cmp.ConfirmBehavior.Insert,
					-- 		select = true,
					-- 	},
					-- 	{ "i", "c" }
					-- ),
					-- add nice enter here

				},

				-- Enable luasnip to handle snippet expansion for nvim-cmp
				-- i don't use snippets
				-- snippet = {
				-- 	expand = function(args)
				-- 		vim.snippet.expand(args.body)
				-- 	end,
				-- },
			}

			-- complete for search from buffer text
			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})
			-- completions for command mode
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources {
					{ name = 'path' },
					{ name = 'cmdline' }
				}
			})

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
