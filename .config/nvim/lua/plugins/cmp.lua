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
			"hrsh7th/cmp-nvim-lsp-document-symbol"
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
					-- don't understand why text is included sadly
					{ name = "nvim_lsp" }, -- lsp source
					{ name = "path" },
					{ name = "crates" },
				},
				-- todo: move these mappings to regular keymap file for consistency
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
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
					end, { "i", "s" }),
					["<enter>"] = cmp.mapping(
						cmp.mapping.confirm {
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						},
						{ "i" } -- only insert mode, not command
					),
				},

				-- Enable luasnip to handle snippet expansion for nvim-cmp
				-- i don't use snippets, maybe I should though
				-- would be handy to insert e.g. function arguments
				-- snippet = {
				-- 	expand = function(args)
				-- 		vim.snippet.expand(args.body)
				-- 	end,
				-- },
				-- might actually be nice for things like function parameters
				-- see how we go
			}

			-- cmp for searching
			-- todo: probably doesn't work with telescope fuzzy finding
			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'nvim_lsp_document_symbol' },
					{ name = 'buffer' }
				}
			})
			-- completions for command mode
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources {
					{ name = 'cmdline' },
					{ name = 'path' }
				}
			})
		end,
	},
}
