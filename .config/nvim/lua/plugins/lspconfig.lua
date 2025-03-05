-- lsp-config
-- community sourced configs for lsp integrations
-- https://github.com/neovim/nvim-lspconfig

return {
	'neovim/nvim-lspconfig',
	-- only load in lsp configured filetypes (manually enabled)
	ft = {
		'lua',
		'python',
		'go',
		'toml',
		'sh',
		'c',
		'cpp',
		'swift',
		'typescript',
		'javascript',
		'astro',
		'kotlin',
		'json',
		'rust',
		'cuda',
		'proto',
		'swift',
		'objective-c',
		'objective-cpp',
		'markdown',
		'crystal', -- not actually configured here, but for LspInfo
		-- todo: any more files with lsp
	},
	cmd = { 'LspInfo' },
	dependencies = {
		-- todo: is this the only place schemastore is depended on from?
		'b0o/SchemaStore.nvim',
		-- dependant on cmp shim
		'hrsh7th/cmp-nvim-lsp',
		-- fancy progress reporting
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
		-- todo: would be good to use same interface for task running potentially
	},
	config = function()
		-- lsp config
		local lspconfig = require 'lspconfig'

		-- need to inject capabilities for proper completions determined by server capabilities
		-- makes the config here a bit wordy
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		-- reduce log level
		vim.lsp.set_log_level(vim.log.levels.ERROR)

		-- setup language servers
		-- lua
		lspconfig.lua_ls.setup {
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						-- don't return workspace text completions
						workspaceWord = false,
						showWord = 'Disable',
					},
				},
			},
			on_init = function(client)
				local path = client.workspace_folders[1].name
				-- skip if luarc present (luals configures itself by this file anyway)
				-- todo: fs_stat not found so not sure if this is working correctly
				if vim.uv.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then return end
				-- extend settings (by default)
				client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
					-- jit version used by neovim
					runtime = { version = 'LuaJIT' },
					-- make the server aware of neovim runtime files
					workspace = {
						checkThirdParty = false,
						-- vim globals in the namespace
						-- library = { vim.env.VIMRUNTIME },
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						library = vim.api.nvim_get_runtime_file('', true),
						-- can't really tell any difference tbh, still testing
					},
				})
			end,
		}

		-- bash
		lspconfig.bashls.setup {
			capabilities = capabilities,
		}

		-- python
		lspconfig.pyright.setup {
			capabilities = capabilities,
		}

		-- go
		lspconfig.gopls.setup {
			capabilities = capabilities,
			enhanced_hover = true,
		}

		-- toml
		-- todo: root not set correctly without .taplo.toml
		-- todo: possibly conflicts with crates.nvim for Crates.toml files
		lspconfig.taplo.setup {
			capabilities = capabilities,
			single_file_support = true,
		}

		-- c/cpp
		-- todo: not sure we need this with clangd extensions plugin
		lspconfig.clangd.setup {
			capabilities = capabilities,
			filetypes = { 'c', 'cpp', 'cuda', 'proto' },
		}

		-- swift, objective c/cpp
		lspconfig.sourcekit.setup {
			capabilities = capabilities,
			filetypes = { 'swift', 'objective-c', 'objective-cpp' },
		}

		-- rust
		lspconfig.rust_analyzer.setup {
			capabilities = capabilities,
			settings = {
				['rust-analyzer'] = {
					check = {
						-- lint with clippy
						command = 'clippy',
					},
				},
			},
		}

		-- kotlin
		lspconfig.kotlin_language_server.setup {
			capabilities = capabilities,
			single_file_support = true,
		}

		-- marksman (markdown)
		-- requires manual server installation
		-- todo: this isn't working if it can't detect root?
		lspconfig.marksman.setup {
			capabilities = capabilities,
			single_file_support = true,
		}

		-- web
		-- vscode ls
		lspconfig.jsonls.setup {
			capabilities = capabilities,
			settings = {
				json = {
					-- validate schemas very nice
					-- todo: verify this schemastore stuff with some json w known schema
					schemas = require('schemastore').json.schemas(),
					validate = { enable = true },
				},
			},
		}
		-- todo: .h currently recognised as cpp headers not c (might be fixed with compile_commands.json)
		-- todo: tailwind server

		lspconfig.sqls.setup {
			on_attach = function(client, bufnr)
				-- require('sqls').on_attach(client, bufnr) -- require sqls.nvim
			end,
			-- settings = {
			-- 	sqls = {
			-- 		connections = {
			-- 			{
			-- 				driver = 'postgresql',
			-- 				dataSourceName = 'host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable',
			-- 			},
			-- 		},
			-- 	},
			-- },
		}

		lspconfig.ts_ls.setup {}

		lspconfig.tailwindcss.setup {}

		-- not pictured: crystalline, configured in crystal.lua plugin file
		-- todo: move crystalline config into the regular lspconfig to get reporing from LspInfo command configured servers list
	end,
}
