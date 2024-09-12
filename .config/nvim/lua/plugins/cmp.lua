-- nvim-cmp
-- unified completions
-- https://github.com/hrsh7th/nvim-cmp

return {
	'hrsh7th/nvim-cmp',
	lazy = true,
	-- also command mode & search
	event = { 'InsertEnter', 'CmdlineEnter' },
	-- note that for e.g. man buffers we could never have to load cmp if this loaded lazy
	priority = 100,
	dependencies = {
		-- 'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'ray-x/cmp-treesitter',
		'saadparwaiz1/cmp_luasnip',

	},
	-- todo: only complete after at least one letter typed
	-- does 'keys' need to be defined?
	config = function()
		local cmp = require 'cmp'
		local luasnip = require 'luasnip'
		-- makes more sense to have ft specific sources injected from their own config if possible
		cmp.setup {
			-- todo: only one source at a time?
			-- buffer completion sources
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'nvim_lsp_signature_help' },
				-- todo: is this filter worth revisiting? have configured things individually not to use text completions
				--, entry_filter = function(entry) return entry.type ~= 'Text' end },
				{ name = 'luasnip' }, -- todo: not doing much in cmp, only snippet jumping working
			},

			-- view options
			view = {
				docs = {
					auto_open = true,
				},
			},

			-- todo: potentially move these mappings for consistency w regular keymap file
			mapping = {
				-- mapping to always open completion
				['<c-space>'] = cmp.mapping(function() cmp.complete() end, { 'i', 's', 'c' }),
				-- tab to expand or cycle completions
				['<tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { 'i', 's', 'c' }),
				['<s-tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					-- reverse direction?
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { 'i', 's', 'c' }),
				-- bind to open cmp any buffer always
				-- todo: only confirm complete if item is selected
				['<enter>'] = cmp.mapping(
					cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Insert,
						select = false,
					},
					{ 'i', 's', 'c' }
				),
			},

			-- enable luasnip to handle snippet expansion for nvim-cmp
			snippet = {
				expand = function(args) luasnip.lsp_expand(args.body) end,
			},
		}

		-- cmp for searching
		cmp.setup.cmdline('/', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				-- fill search from treesitter only for max finding speed
				{ name = 'treesitter' },
			},
		})

		-- completions for command mode
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources {
				{ name = 'path' },
				-- annoyingly cmdline source doubles up with path completions, but path works better
				-- todo: cmdline show correct types for completions, all 'variable'
				{ name = 'cmdline', options = { treat_trailing_slash = true } },
			},
		})
	end,
}
