-- crates
-- rich helpers for authoring Cargo.toml files
-- https://github.com/saecki/crates.nvim

return {
	'saecki/crates.nvim',
	event = { 'BufRead Cargo.toml' },
	opts = {
		completion = {
			cmp = {
				enabled = true,
			},
			crates = {
				enabled = true, -- disabled by default
				max_results = 8, -- maximum number of search results to display
				min_chars = 2, -- minimum number of characters to type before completions begin appearing
			},
			-- disable icons in completions
			text = {
				prerelease = ' pre-release ',
				yanked = ' yanked ',
			},
		},
		lsp = {
			enabled = true,
			actions = true,
			completion = true,
			hover = true,
		},

		-- following is to totally disable icons
		text = {
			loading = '  loading...',
			version = '  %s',
			prerelease = '  %s',
			yanked = '  %s yanked',
			nomatch = '  not found',
			upgrade = '  %s',
			error = '  error fetching crate',
		},
		popup = {
			text = {
				title = '# %s',
				pill_left = '',
				pill_right = '',
				created_label = 'created        ',
				updated_label = 'updated        ',
				downloads_label = 'downloads      ',
				homepage_label = 'homepage       ',
				repository_label = 'repository     ',
				documentation_label = 'documentation  ',
				crates_io_label = 'crates.io      ',
				categories_label = 'categories     ',
				keywords_label = 'keywords       ',
				version = '%s',
				prerelease = '%s pre-release',
				yanked = '%s yanked',
				enabled = '* s',
				transitive = '~ s',
				normal_dependencies_title = '  dependencies',
				build_dependencies_title = '  build dependencies',
				dev_dependencies_title = '  dev dependencies',
				optional = '? %s',
				loading = ' ...',
			},
		},
	},
}
