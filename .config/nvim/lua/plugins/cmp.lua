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
		'ray-x/cmp-treesitter',
		'L3MON4D3/LuaSnip',
		-- also crates mentioned
		-- snippet
		'saadparwaiz1/cmp_luasnip',
		-- 'nvim-orgmode/orgmode',
	},
	-- todo: only complete after at least one letter typed
	-- does 'keys' need to be defined?
	config = function()
		local cmp = require 'cmp'
		local luasnip = require 'luasnip'
		-- makes more sense to have ft specific sources injected from their own config if possible
		cmp.setup {
			-- todo: only one source at a time
			sources = {
				-- { name = 'treesitter' }, -- crazy experiment: no way, way too confusing
				{ name = 'nvim_lsp' }, --, entry_filter = function(entry) return entry.type ~= 'Text' end },
				{ name = 'luasnip' }, -- see about this one
				{ name = 'crates' }, -- also only very specific filetypes using this
				-- { name = 'orgmode' },
			},

			-- todo: need to always have doc hover open when selecting competions (maybe its just ts)

			-- todo: potentially move these mappings for consistency w regular keymap file
			mapping = {
				-- always show completion
				['<c-space>'] = cmp.mapping(function() cmp.complete() end, { 'i', 's', 'c' }),
				-- luasnip tab version
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
				-- todo: expand snippet w luasnip
				['<enter>'] = cmp.mapping(
					cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Insert,
						select = false,
					},
					{ 'i' } -- only insert mode, not command
				),
			},

			-- enable luasnip to handle snippet expansion for nvim-cmp
			snippet = {
				-- expand = function(args) vim.snippet.expand(args.body) end,
				expand = function(args) luasnip.lsp_expand(args.body) end,
			},
			-- snippet = {
			-- 	-- haven't figured out snippets yet
			-- 	expand = function(args) require('luasnip').lsp_expand(args.body) end,
			-- },
		}

		-- cmp for searching
		cmp.setup.cmdline('/', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'treesitter' },
			},
		})

		-- completions for command mode
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources {
				-- todo: improve cmdline completions if possible, all 'variable'
				{ name = 'cmdline' },
				{ name = 'path' },
			},
		})
	end,
}
