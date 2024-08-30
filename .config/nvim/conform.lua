-- this isn't working so disable
return {
	'stevearc/conform.nvim',
	-- opts = {},
	config = function()
		-- setup formatters
		local conform = require "conform"

		conform.setup {
			lua = { "stylua", lsp_format = "fallback" },
			-- Conform will run multiple formatters sequentially
			-- python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
		}
	end
}
