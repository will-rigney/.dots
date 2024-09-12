-- crystal support for vim
-- also configures crytalline lsp server

return {
	'vim-crystal/vim-crystal',
	lazy = true,
	ft = 'crystal',
	config = function()
		-- todo: check does this run it twice
		-- todo: move into lspconfig regular structure
		-- start lsp with autocmd
		vim.api.nvim_create_autocmd('FileType', {
			pattern = 'crystal',
			callback = function(ev)
				print("crystal detected...")
				-- todo: don't restart if already running
				vim.lsp.start {
					name = 'crystalline',
					cmd = { '/home/will/dev/crystalline/bin/crystalline' },
					root_dir = vim.fs.root(ev.buf, { 'shard.yml' }),
				}
			end,
		})
	end,
}
