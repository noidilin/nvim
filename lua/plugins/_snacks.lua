return {
	"folke/snacks.nvim",
	opts = {
		styles = { float = { backdrop = 85 } },
		gh = {}, -- leave it empty to use the default settings
		picker = {
			sources = {
				gh_issue = {}, -- leave it empty to use the default settings
				gh_pr = {}, -- leave it empty to use the default settings
			},
			win = {
				input = {
					keys = {
						["<a-b>"] = { "toggle_hidden", mode = { "n", "i" } },
						["J"] = { "preview_scroll_down", mode = "n" },
						["K"] = { "preview_scroll_up", mode = "n" },
					},
				},
				list = {
					keys = {
						["J"] = "preview_scroll_down",
						["K"] = "preview_scroll_up",
					},
				},
				preview = {
					keys = {
						["J"] = "preview_scroll_down",
						["K"] = "preview_scroll_up",
					},
				},
			},
			layout = function()
				return vim.o.columns >= 150 and { preset = "default" }
					or {
						layout = {
							width = 0.8,
							min_width = 80,
							height = 0.8,
							min_height = 30,
							box = "vertical",
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", height = 0.7, border = "top" },
						},
					}
			end,
		},
	},
	keys = {
		{
			"<leader>gi",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "GitHub Issues (open)",
		},
		{
			"<leader>gI",
			function()
				Snacks.picker.gh_issue({ state = "all" })
			end,
			desc = "GitHub Issues (all)",
		},
		{
			"<leader>gp",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "GitHub Pull Requests (open)",
		},
		{
			"<leader>gP",
			function()
				Snacks.picker.gh_pr({ state = "all" })
			end,
			desc = "GitHub Pull Requests (all)",
		},
	},
}
