return {
	{ "nvzone/volt", lazy = true },
	{ "nvzone/minty", cmd = { "Shades", "Huefy" } },
	{
		"nvzone/showkeys",
		cmd = "ShowkeysToggle",
		opts = {
			timeout = 2,
			maxkeys = 5,
			-- show_count = true,
		},
	},
	{
		"2kabhishek/nerdy.nvim",
		cmd = "Nerdy",
		dependencies = {
			"folke/snacks.nvim",
		},
		opts = {
			max_recents = 30,
			add_default_keybindings = false,
			copy_to_clipboard = false, -- Copy glyph to clipboard instead of inserting
		},
	},
}
