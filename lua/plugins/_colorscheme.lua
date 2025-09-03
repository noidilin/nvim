return {
	{
		"rktjmp/lush.nvim",
		{
			dir = vim.fn.stdpath("config") .. "/lua/theme",
			lazy = false, -- load this during startup, since its the main colorscheme
		},
	},
	{
		"vague2k/vague.nvim",
		lazy = true,
		opts = {},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "color-fatigue",
		},
	},
}
