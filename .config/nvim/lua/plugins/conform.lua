-- conform.nvim
-- unified formatter setup for neovim

return {
	"stevearc/conform.nvim",
	config = function()
		-- setup formatters
		local conform = require "conform"
		conform.setup {
			default_format_opts = {
				-- always fallback onto lsp format results
				lsp_format = "fallback",
				-- conform will run the first available formatter
				stop_after_first = true,
			},
			formatters_by_ft = {
				go = { "gofmt" },
				javascript = { "prettierd", "prettier" },
				lua = { "stylua" },
				python = { "ruff_format", "isort", "black" },
				rust = { "rustfmt" },
			}
		}
		-- define formatexpr
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
