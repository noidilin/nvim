return {
	{ "ggandor/leap.nvim", enabled = false },
	{
		-- BUG: char mode in macro [bug: Weird behavior when using f in a macro](https://github.com/folke/flash.nvim/issues/379)
		"folke/flash.nvim",
		vscode = true,
		opts = {
			modes = { char = { enabled = false } },
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
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
								backdrop = false,
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
	},
	{
		"saghen/blink.cmp",
		opts = {
			keymap = { preset = "default", ["<Up>"] = {}, ["<Down>"] = {} },
			sources = {
				providers = {
					snippets = {
						opts = {
							-- disable friendly-snippet frameworks, except for in rust.
							filter_snippets = function(ft, file)
								local disabled_fts = {
									javascript = true,
									javascriptreact = true, -- .jsx
									typescript = true,
									typescriptreact = true, -- .tsx
								}

								-- check if the snippet file path contains 'friendly-snippet' or 'javascript'
								if
									disabled_fts[ft]
									and string.match(file, "friendly.snippets")
									and string.match(file, "javascript")
								then
									return false
								end

								-- allow everything else by default
								return true
							end,
						},
					},
				},
			},
		},
	},
	{
		"nvim-mini/mini.move",
		event = "VeryLazy",
		opts = {
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<M-Left>",
				right = "<M-Right>",
				down = "<M-Down>",
				up = "<M-Up>",
				-- Move current line in Normal mode
				line_left = "<M-Left>",
				line_right = "<M-Right>",
				line_down = "<M-Down>",
				line_up = "<M-Up>",
			},
		},
	},
	{
		"folke/sidekick.nvim",
		opts = {
			nes = { enabled = false },
		},
	},
}
