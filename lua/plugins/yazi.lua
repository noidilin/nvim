return {
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			"folke/snacks.nvim",
			{ "nvim-lua/plenary.nvim", lazy = true },
			{
				"folke/which-key.nvim",
				opts = {
					spec = {
						{ "<leader>y", group = "+yazi", mode = { "n", "v" }, icon = { icon = "󰇥" } },
						mode = { "n", "v" },
						{
							"<leader>yy",
							"<cmd>Yazi toggle<cr>",
							desc = "Resume last session",
							icon = { icon = "󰇥" },
						},
						{ "<leader>yd", "<cmd>Yazi cwd<cr>", desc = "Open yazi in cwd", icon = { icon = "" } },
						{ "<leader>yf", "<cmd>Yazi<cr>", desc = "Open yazi at current file", icon = { icon = "󰈔" } },
					},
				},
			},
		},
		keys = {},
		opts = {},
	},
}
