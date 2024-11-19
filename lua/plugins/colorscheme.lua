return {
	-- { "rebelot/kanagawa.nvim" }, { "sho-87/kanagawa-paper.nvim" },
	{ "aktersnurra/no-clown-fiesta.nvim" },
	{
		"slugbyte/lackluster.nvim",
		opts = {
			tweak_syntax = { comment = "#555555", keyword = "#878787" },
			tweak_background = { normal = "#191919", telescope = "#1e1e1e", menu = "#242424", popup = "#1e1e1e" },
		},
	},

	{
		"vague2k/vague.nvim",
		lazy = true,
		opts = {
			transparent = false, -- don't set background
			style = {
				-- "none" is the same thing as default. But "italic" and "bold" are also valid options
				boolean = "none",
				number = "none",
				float = "none",
				error = "none",
				comments = "italic",
				conditionals = "none",
				functions = "none",
				headings = "bold",
				operators = "none",
				strings = "italic",
				variables = "none",
				-- keywords
				keywords = "bold",
				keyword_return = "none",
				keywords_loop = "none",
				keywords_label = "none",
				keywords_exception = "none",
				-- builtin
				builtin_constants = "italic",
				builtin_functions = "italic",
				builtin_types = "italic",
				builtin_variables = "italic",
			},
			colors = {
				bg = "#191919", -- "#18191a",
				fg = "#878787", -- "#cdcdcd",
				floatBorder = "#414141", -- "#878787",
				line = "#2a2a2a", -- "#282830",
				comment = "#555555", -- "#646477",
				builtin = "#aaaaaa", -- "#bad1ce",
				func = "#c0c0c0", -- "#be8c8c",
				string = "#707070", -- "#deb896",
				number = "#878787", -- "#d2a374",
				property = "#8e8b85", -- "#c7c7d4",
				constant = "#b4b0a7", -- "#b4b4ce",
				parameter = "#878787", -- "#b9a3ba",
				visual = "#353535", -- "#363738",
				error = "#b07878", -- "#d2788c",
				warning = "#c8a492", -- "#e6be8c",
				hint = "#8e897d", -- "#8ca0dc",
				operator = "#9d9d9d", -- "#96a3b2",
				keyword = "#9d9d9d", -- "#7894ab",
				type = "#eaeaea", -- "#a1b3b9",
				search = "#474747", -- "#465362",
				plus = "#778777", -- "#8faf77",
				delta = "#d6caab", -- "#e6be8c",
			},
		},
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "color-fatigue",
			-- colorscheme = "vague",
		},
	},
}
