-- crates
-- rich helpers for authoring Cargo.toml files
-- https://github.com/saecki/crates.nvim

return {
	'saecki/crates.nvim',
	event = { "BufRead Cargo.toml" },
	config = function()
		require('crates').setup {
			completion = {
				cmp = {
					enabled = true,
				},
				crates = {
					enabled = true, -- disabled by default
					max_results = 8, -- The maximum number of search results to display
					min_chars = 3 -- The minimum number of charaters to type before completions begin appearing
				},
				-- disable icons in completions
				text = {
					prerelease = " pre-release ",
					yanked = " yanked ",
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
				loading = "  Loading...",
				version = "  %s",
				prerelease = "  %s",
				yanked = "  %s yanked",
				nomatch = "  Not found",
				upgrade = "  %s",
				error = "  Error fetching crate",
			},
			popup = {
				text = {
					title = "# %s",
					pill_left = "",
					pill_right = "",
					created_label = "created        ",
					updated_label = "updated        ",
					downloads_label = "downloads      ",
					homepage_label = "homepage       ",
					repository_label = "repository     ",
					documentation_label = "documentation  ",
					crates_io_label = "crates.io      ",
					categories_label = "categories     ",
					keywords_label = "keywords       ",
					version = "%s",
					prerelease = "%s pre-release",
					yanked = "%s yanked",
					enabled = "* s",
					transitive = "~ s",
					normal_dependencies_title = "  Dependencies",
					build_dependencies_title = "  Build dependencies",
					dev_dependencies_title = "  Dev dependencies",
					optional = "? %s",
					loading = " ...",
				},
			},
		}
	end,
}
