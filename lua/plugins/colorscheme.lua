return {
	-- { "aktersnurra/no-clown-fiesta.nvim" },
	--[[
	{
		"slugbyte/lackluster.nvim",
		opts = {
			tweak_syntax = { comment = "#555555", keyword = "#878787" },
			tweak_background = { normal = "#191919", telescope = "#1e1e1e", menu = "#242424", popup = "#1e1e1e" },
		},
	},
  ]]

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
				bg = "#191919",
				fg = "#878787",
				floatBorder = "#414141",
				line = "#2a2a2a",
				comment = "#555555",
				builtin = "#aaaaaa",
				func = "#c0c0c0",
				string = "#707070",
				number = "#878787",
				property = "#8e8b85",
				constant = "#b4b0a7",
				parameter = "#878787",
				visual = "#353535",
				error = "#b07878",
				warning = "#c8a492",
				hint = "#8e897d",
				operator = "#9d9d9d",
				keyword = "#9d9d9d",
				type = "#eaeaea",
				search = "#474747",
				plus = "#778777",
				delta = "#d6caab",
			},
		},
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "color-fatigue",
		},
	},
}
