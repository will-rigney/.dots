--------------------------------------------
-- Will Rigney's ultimate lua nvim config --
--------------------------------------------

-- todo: this file way too long! move to modules

---- aliases ----
-- global
local vim = vim

-- todo: make some nice functions for setting values

---- vim config ----
-- basic editor settings
vim.opt.number = true					-- show line numbers
vim.opt.relativenumber = true           -- relative line numbers (todo: only sometimes, eg in edit mode or w/e)

vim.opt.ignorecase = true               -- ignore case in search
vim.opt.smartcase = true                -- unless /C or captital in search

vim.o.updatetime = 250					-- decrease update time
vim.wo.signcolumn = 'yes'				-- dno

vim.opt.smartindent = true              -- insert indents automatically
vim.opt.undofile = true					-- save undo history

vim.opt.tabstop = 4						-- use hard tabs width 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0

vim.o.title = true;

-- todo: not every type of document needs an 80 column marker
-- todo: markdown should have better wrapping behaviour
vim.opt.colorcolumn = '80'				-- superior 80 column marker

vim.o.mouse = 'a'						-- enable mouse mode

-- completion for vim commands
vim.o.inccommand = 'nosplit'			-- incremental completion
vim.o.completeopt = 'menuone,noselect'	-- completeopt?
vim.opt.wildmode = {'list', 'longest'}  -- Command-line completion mode

vim.o.hidden = true						-- don't save when switching buffers

-- leader
vim.g.mapleader = ','					-- map leader to comma
vim.g.maplocalleader = ','

--Map blankline
vim.g.indent_blankline_char = '┊'

vim.g.indent_blankline_filetype_exclude = { 'help' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

vim.o.wrap = true
vim.o.linebreak = true

-- messes up pywal colourscheme
vim.o.termguicolors = true				-- true colour support

-- spellcheck languages
vim.opt.spelllang = { 'en', 'cjk' }		-- english + east asian chars

vim.env.BASH_ENV = "$HOME/.bashrc"
-- bindings
-- nvim tree
-- todo: like mapops or something
local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>NvimTreeRefresh<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>NvimTreeFindFile<CR>', opts)

-- toggle spell check
vim.api.nvim_set_keymap('n', '<leader>sc', '<cmd>set spell!<CR>', opts)

-- telescope ('f' for find)
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fa', '<cmd>Telescope lsp_code_actions<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>Telescope lsp_references<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>Telescope lsp_document_diagnostics<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fD', '<cmd>Telescope lsp_workspace_diagnostics<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fS', '<cmd>Telescope lsp_workspace_symbols<cr>', opts)

vim.api.nvim_set_keymap('n', '<leader>fgb', '<cmd>Telescope git_branches<cr>', opts)

-- dap
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua require("dapui").toggle()<cr>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>dt', '<cmd>lua require("dapui").toggle("tray")<cr>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>ds', '<cmd>lua require("dapui").toggle("sidebar")<cr>', opts)

-- automatically show all diagnostics on the current line in a floating window.
vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float()')
vim.o.updatetime = 300

-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  'n', '<Leader>n', '<cmd>lua vim.diagnostic.goto_next()<CR>',
  { noremap = true, silent = true }
)
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  'n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>',
  { noremap = true, silent = true }
)

-- experimental - set lsp bindings even when server not attached!!
vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- should use these opts outside
-- local opts = { noremap = true, silent = true }

-- todo: bindings prefixed with 'g' for goto need more consistency
vim.api.nvim_set_keymap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

-- leader workspace (not used? pointless?)

-- why not g
vim.api.nvim_set_keymap('n', '<leader>gT', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

-- incorrect
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>ra', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

-- -- nice
-- vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

-- quickfix diagnostics
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

-- end experiement!!

---- plugins ----
--paq (package manager)
require "paq" {
	"savq/paq-nvim";								-- plugin manager
	"nvim-lua/popup.nvim";							-- fancy popup provider
	"nvim-lua/plenary.nvim";						-- shared utils
	"cappyzawa/trim.nvim";							-- strip trailing whitespace
	"kyazdani42/nvim-web-devicons";					-- icons
	"nvim-telescope/telescope.nvim";				-- fuzzy finding
	"folke/which-key.nvim";							-- which key
	"numToStr/Comment.nvim";						-- comments
	"lewis6991/gitsigns.nvim";						-- git in buffer
	-- "kyazdani42/nvim-tree.lua";						-- replace netrw (sry bram)
	"windwp/nvim-autopairs";						-- autopairs
	"nvim-treesitter/nvim-treesitter";				-- treesitter parsing
	"nvim-treesitter/nvim-treesitter-refactor";		-- treesitter refactoring support
	-- "mfussenegger/nvim-dap";						-- debug adapter protocol
	-- "rcarriga/nvim-dap-ui";						-- nice ui for dap
	"neovim/nvim-lspconfig";						-- lsp config
	"williamboman/nvim-lsp-installer";				-- auto install lsp servers
	"hrsh7th/nvim-cmp";								-- completions
	"hrsh7th/cmp-nvim-lsp";							-- lsp completion source
	"hrsh7th/cmp-path";								-- path completion source
	"ray-x/lsp_signature.nvim",						-- lsp function signature hints
	"L3MON4D3/LuaSnip";								-- snippets
	"simrat39/rust-tools.nvim";						-- extra features of rust lsp
	"Saecki/crates.nvim";							-- crates.io help
	"famiu/feline.nvim";							-- lazy statusline
	-- "ftilde/vim-ugdb";								-- ugdb integration
	-- colour schemes
	-- "novakne/kosmikoa.nvim";
	"NTBBloodbath/doom-one.nvim";
	"EdenEast/nightfox.nvim";
}
-- use:
--   :PaqInstall to install all plugins
--   :PaqUpdate to update them
--   :PaqClean to remove unused
--   :PaqSync to do it all

-- config for diagnostics (doesn't know what this is without calling Paq first)
vim.diagnostic.config({
  virtual_text = false, -- Turn off inline diagnostics
})

-- change to 'light'/'dark' to change coloursheme variant
vim.opt.background = 'dark'

-- setup doom colourscheme
require('doom-one').setup({
	cursor_coloring = false,
    terminal_colors = true,
	plugins_integrations = {
		telescope = true
	},
	transparent_background = false,
	pumblend = {
		enable = false,
		transparency_amount = 20,
	},
	plugins_integration = {
		whichkey = false,
	}
})

-- lighter comment colours
-- Comment
vim.api.nvim_command('highlight Comment guifg=#727a82')

-- trim: trims trailing whitespace
local config = {
  disable = {},
  patterns = {
    [[%s/\s\+$//e]],
    [[%s/\($\n\s*\)\+\%$//]],
    [[%s/\%^\n\+//]],
    [[%s/\(\n\n\)\n\+/\1/]],
  },
}
require('trim').setup(config)

-- telescope
-- todo: some configuration
require('telescope').setup()

-- which key
require('which-key').setup()

-- comment (automatic comment lines)
require('Comment').setup()

-- git in buffers
require('gitsigns').setup()

-- unholy file tree browser
-- todo: gone... replace with nnn.nvim or similar

-- autopairs
require('nvim-autopairs').setup()

-- treesitter configuration
-- install parsers manually via :TSInstall
-- todo: can probably remove some of this default config mess
require('nvim-treesitter.configs').setup {
	ensure_installed = { "rust", "toml", "lua", "svelte", "typescript", "markdown", "c", "cpp" },
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			-- todo: configure these bindings properly
		},
	},
	refactor = {
		highlight_definitions = { enable = true },
		smart_rename = { enable = true }
	},
}

-- lsp settings
local nvim_lsp = require 'lspconfig'
-- this lsp config is wack as hell, barely works
-- todo: probably because of rust-tools plugin
local on_attach = function(_, bufnr)
	--
	-- -- todo: some local helper for setting bindings to make more tractable
	-- this is where we would put clever late initialisation for lsp on attach
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- cmp_nvim_lsp extra completions
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- todo: this should use the same opts as lsp installer + rust-tools
-- enable language servers
-- 'rust_analyzer' handled by other plugin (for now...)
-- todo: remove / consolidate that thing
local servers = { 'clangd', 'pyright', 'rust_analyzer' }

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- tool to install lsp servers
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local server_opts = {}
    server:setup(server_opts)
end)

-- lsp signature (nb should be on_attach?)
-- todo: what does this do again..
require('lsp_signature').setup()

-- snippets
local luasnip = require('luasnip')

-- rust tools
local rust_opts = {
    tools = {
        autoSetHints = false,
        hover_with_actions = true,
        runnables = {
			use_telescope = false
        },
        debuggables = {
			use_telescope = true
        },
        inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = " ",
        },
    },
    server = {
        on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy",
					allTargets = false
                },
				proc_macro = { enable = true }
            }
        }
    },
}

require('rust-tools').setup(rust_opts)

-- crates tools
require('crates').setup()

-- setup completions (nvim-cmp)
local cmp = require 'cmp'
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		-- nice like emacs
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),

		-- todo: change this to be usable (like jump in & out of docs)
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),

		['<C-Space>'] = cmp.mapping.complete(),

		-- least used binding
		['<C-e>'] = cmp.mapping.close(),

		-- most used binding ever
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},

		-- ultratab (don't really use)
		-- ['<Tab>'] = function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 		elseif luasnip.expand_or_jumpable() then
		-- 		luasnip.expand_or_jump()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end,
		-- ['<S-Tab>'] = function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 		elseif luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'luasnip' },
		{ name = 'crates' },
		-- todo: buffer, etc, etc, etc
	},
}

-- statusline
-- todo: pretty basic of me
require('feline').setup {
	preset = 'noicon'
}
