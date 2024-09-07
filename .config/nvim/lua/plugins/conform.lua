-- this isn't working so disable
return {
	"stevearc/conform.nvim",
	-- opts = {
	-- 	lua = { "stylua" },
	-- 	-- Conform will run multiple formatters sequentially
	-- 	-- format one or the other only
	-- 	python = { "ruff_format", "isort", "black", stop_after_first = true },
	-- 	-- you can customize some of the format options for the filetype (:help conform.format)
	-- 	rust = { "rustfmt" },
	-- 	-- conform will run the first available formatter
	-- 	javascript = { "prettierd", "prettier", stop_after_first = true },
	-- 	default_format_opts = {
	-- 		lsp_format = "fallback",
	-- 	},
	-- },
	config = function()
		-- setup formatters
		local conform = require "conform"

		conform.setup {
			default_format_opts = {
				-- conform will run the first available formatter
				stop_after_first = true,
				-- always fallback onto lsp format results
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format", "isort", "black", stop_after_first = true },
				rust = { "rustfmt" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			}
		}
		-- define formatexpr
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		-- vim.o.formatexpr = conform.formatexpr()
	end,
}
