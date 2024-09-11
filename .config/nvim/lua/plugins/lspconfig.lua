-- lsp-config
-- community sourced configs for lsp integrations
-- https://github.com/neovim/nvim-lspconfig

-- todo: get rid of little square icons in diagnostic virtual text for rust

return {
	'neovim/nvim-lspconfig',
	-- only load in lsp configured filetypes (manually enabled)
	ft = { 'lua', 'python', 'go', 'toml', 'sh', 'c', 'cpp', 'swift', 'typescript', 'json', 'rust' },
	cmd = { 'LspInfo' },
	dependencies = {
		'b0o/SchemaStore.nvim',
		-- needed for fancy progress message in bottom corner
		-- i think we also want this for running vscode style 'tasks' in the future
		{
			'j-hui/fidget.nvim',
			opts = {
				progress = {
					display = {
						-- done message is another little face
						done_icon = require('decor').get_face(),
					},
				},
				logger = {
					level = vim.log.levels.ERROR,
				},
				integration = {
					['xcodebuild-nvim'] = {
						enable = true, -- integrate with wojciech-kulik/xcodebuild.nvim (if installed)
					},
				},
			},
		},
	},
	config = function()
		-- todo: should always be using capabilities reported by attached ls
		-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
		-- lsp config
		local lspconfig = require 'lspconfig'

		-- reduce log level
		vim.lsp.set_log_level(vim.log.levels.ERROR)

		-- setup language servers
		-- lua
		-- todo: filter lua virtual text to just have the end part without the source
		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					completion = {
						-- don't return text completions
						workspaceWord = false,
						showWord = 'Disable',
					},
				},
			},
			on_init = function(client)
				local path = client.workspace_folders[1].name

				-- skip if luarc present (ig luals configures itself by this file anyway)
				-- i think this actually breaks lua ls
				if vim.uv.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then return end

				client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
					-- neovim jit version
					runtime = { version = 'LuaJIT' },
					-- make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						-- vim globals in the namespace
						-- library = { vim.env.VIMRUNTIME },
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						library = vim.api.nvim_get_runtime_file('', true),
						-- can't really tell any difference tbh
					},
				})
			end,
		}
		-- bash
		lspconfig.bashls.setup {}
		-- python
		lspconfig.pyright.setup {}
		-- go
		lspconfig.gopls.setup {
			enhanced_hover = true,
		}
		-- toml
		-- todo: root not set correctly without .taplo.toml
		-- todo: possibly conflicts with crates.nvim for Crates.toml files
		lspconfig.taplo.setup {
			single_file_support = true,
		}
		-- c/cpp
		-- todo: not sure we need this with clangd extensions plugin
		lspconfig.clangd.setup {
			filetypes = { 'c', 'cpp', 'cuda', 'proto' },
		}
		-- swift, objective c/cpp
		lspconfig.sourcekit.setup {
			filetypes = { 'swift', 'objective-c', 'objective-cpp' },
		}
		-- rust
		lspconfig.rust_analyzer.setup {
			settings = {
				['rust-analyzer'] = {
					check = {
						-- lint with clippy
						command = 'clippy',
					},
				},
			},
		}
		-- marksman (markdown)
		-- requires manual server installation
		lspconfig.marksman.setup {
			single_file_support = true,
		}
		-- web
		-- vscode ls
		lspconfig.jsonls.setup {
			-- server_capabilities = {
			-- 	-- using biome for format instead
			-- 	-- conform i think is configured separately anyway as well
			-- 	documentFormattingProvider = false,
			-- },
			settings = {
				json = {
					-- validate schemas very nice
					schemas = require('schemastore').json.schemas(),
					validate = { enable = true },
				},
			},
		}
		-- todo: .h currently recognised as cpp headers not c (might be fixed with compile_commands.json)

		-- todo: crystalline also requires manual installation
		-- tailwind server would be nice, have to install manually
		-- vscode extracted I think is here already
	end,
}
