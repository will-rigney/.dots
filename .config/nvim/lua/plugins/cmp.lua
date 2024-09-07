-- nvim-cmp
-- unified completions
-- https://github.com/hrsh7th/nvim-cmp

return {
	{
		'hrsh7th/nvim-cmp',
		lazy = false,
		-- note that for e.g. man buffers we could never have to load cmp if this loaded lazy
		priority = 100,
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lsp-document-symbol',
			'hrsh7th/cmp-path',
			'rcarriga/cmp-dap',
		},
		-- todo: only complete after at least one letter typed
		config = function()
			local cmp = require 'cmp'
			cmp.setup {
				sources = {
					{
						name = 'lazydev',
						group_index = 0, -- set group index to 0 to skip loading LuaLS completions
					},
					{ name = 'nvim_lsp' },
					{ name = 'crates' }, -- todo: only in crates files
				},
				-- todo: move these mappings to regular keymap file for consistency
				mapping = {
					['<tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<s-tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { 'i', 's' }),
					-- todo: only confirm complete if item is selected
					['<enter>'] = cmp.mapping(
						cmp.mapping.confirm {
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						},
						{ 'i' } -- only insert mode, not command
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
					{ name = 'buffer' },
				},
			})

			-- completions for command mode
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources {
					{ name = 'cmdline' },
					{ name = 'path' },
				},
			})

			-- completion in dap debug windows
			-- not working?
			cmp.setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
				sources = {
					{ name = 'dap' },
				},
			})
		end,
	},
}
