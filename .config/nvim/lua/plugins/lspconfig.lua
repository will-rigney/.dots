-- lsp-config
-- community sourced configs for lsp integrations
-- https://github.com/neovim/nvim-lspconfig

return
{
	"neovim/nvim-lspconfig",
	dependencies = {
		-- needed for fancy progress message in bottom left corner
		{ "j-hui/fidget.nvim" },
	},
	config = function()
		local lsp = require "lspconfig"

		-- setup language servers
		lsp.lua_ls.setup {}
		lsp.bashls.setup {}
		lsp.pyright.setup {}
		lsp.gopls.setup {
			enhanced_hover = true
		}
		lsp.clangd.setup {
			filetypes = { "c", "cpp", "cuda", "proto" }
		} -- todo: not sure we need this with clangd extensions plugin
		lsp.sourcekit.setup {
			filetypes = { "swift", "objective-c", "objective-cpp" },
		}
		lsp.rust_analyzer.setup {
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
					},
				}
			}
		}

		-- todo: .h currently recognised as cpp headers not c (might be fixed with compile_commands.json)

		-- reload for current file
		vim.api.nvim_exec_autocmds("FileType", {})
	end
}
