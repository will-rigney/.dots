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
		-- lua
		lsp.lua_ls.setup {}
		-- bash
		lsp.bashls.setup {}
		-- python
		lsp.pyright.setup {}
		-- go
		lsp.gopls.setup {
			enhanced_hover = true
		}
		-- c/cpp
		-- todo: not sure we need this with clangd extensions plugin
		lsp.clangd.setup {
			filetypes = { "c", "cpp", "cuda", "proto" }
		}
		-- swift, objective c/cpp
		lsp.sourcekit.setup {
			filetypes = { "swift", "objective-c", "objective-cpp" },
		}
		-- rust
		lsp.rust_analyzer.setup {
			settings = {
				["rust-analyzer"] = {
					check = {
						-- lint with clippy
						command = "clippy",
					},
				}
			}
		}
		-- todo: .h currently recognised as cpp headers not c (might be fixed with compile_commands.json)
	end
}
