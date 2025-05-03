-- stylua: ignore
-- BUG: nushell in win11 not compatible with yazi.nvim currently (2025-04-28)
if true then return {} end
return {
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = { "folke/snacks.nvim" },
		keys = {},
		opts = { keymaps = { show_help = "<f1>" } },
	},
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<leader>y", group = "+yazi", mode = { "n", "v" }, icon = { icon = "󰇥" } },
				mode = { "n", "v" },
				{ "<leader>yy", "<cmd>Yazi toggle<cr>", desc = "Resume last session", icon = { icon = "󰇥" } },
				{ "<leader>yd", "<cmd>Yazi cwd<cr>", desc = "Open yazi in cwd", icon = { icon = "" } },
				{ "<leader>yf", "<cmd>Yazi<cr>", desc = "Open yazi at current file", icon = { icon = "󰈔" } },
			},
		},
	},
}
