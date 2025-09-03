return {
	{
		-- WARN: searching/ replacing for line breaks (`\n` or `\r`) is not support. (issue #28)
		"chrisgrieser/nvim-rip-substitute",
		cmd = "RipSubstitute",
		opts = {},
		keys = {
			{
				"<leader>f/",
				function()
					require("rip-substitute").sub()
				end,
				mode = { "n", "x" },
				desc = " rip substitute",
			},
		},
	},
	{
		"johmsalas/text-case.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
