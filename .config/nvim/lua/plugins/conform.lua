-- conform.nvim
-- unified formatter setup for neovim

return {
	'stevearc/conform.nvim',
	lazy = true,
	config = function()
		-- setup formatters
		local conform = require 'conform'
		conform.setup {
			log_level = vim.log.levels.ERROR,
			default_format_opts = {
				-- always fallback onto lsp format results
				lsp_format = 'fallback',
				-- conform will run the first available formatter
				stop_after_first = true,
			},
			formatters_by_ft = {
				go = { 'gofmt' },
				javascript = { 'prettier' },
				lua = { 'stylua' },
				python = { 'ruff_format' },
				rust = { 'rustfmt' },
				-- toml = { 'taplo' }, -- crates can format, taplo not really working
			},
		}
		-- define formatexpr
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
