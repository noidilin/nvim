return {
	{
		"alker0/chezmoi.vim", -- highlighting for chezmoi files template files
		init = function()
			vim.g["chezmoi#use_tmp_buffer"] = 1
			vim.g["chezmoi#source_dir_path"] = vim.env.HOME .. "/.local/share/chezmoi"
		end,
	},
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
			{
				"folke/which-key.nvim",
				opts = {
					spec = {
						{ "<leader>y", group = "+yazi", mode = { "n", "v" }, icon = { icon = "󰇥" } },
						mode = { "n", "v" },
						{ "<leader>yy", "<cmd>Yazi toggle<cr>", desc = "open last session", icon = { icon = "󰇥" } },
						{ "<leader>yd", "<cmd>Yazi cwd<cr>", desc = "open yazi in cwd", icon = { icon = "" } },
						{ "<leader>yf", "<cmd>Yazi<cr>", desc = "open yazi at current file", icon = { icon = "󰈔" } },
					},
				},
			},
		},
	},
	{
		"mrjones2014/smart-splits.nvim",
		lazy = false,
		keys = {
			{
				"<c-h>",
				function()
					require("smart-splits").move_cursor_left()
				end,
				desc = "move cursor left",
			},
			{
				"<c-j>",
				function()
					require("smart-splits").move_cursor_down()
				end,
				desc = "move cursor down",
			},
			{
				"<c-k>",
				function()
					require("smart-splits").move_cursor_up()
				end,
				desc = "move cursor up",
			},
			{
				"<c-l>",
				function()
					require("smart-splits").move_cursor_right()
				end,
				desc = "move cursor right",
			},
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			{
				"folke/which-key.nvim",
				opts = {
					spec = {
						{ "<leader>1", hidden = true },
						{ "<leader>2", hidden = true },
						{ "<leader>3", hidden = true },
						{ "<leader>4", hidden = true },
						{ "<leader>5", hidden = true },
						{ "<leader>6", hidden = true },
						{ "<leader>7", hidden = true },
						{ "<leader>8", hidden = true },
						{ "<leader>9", hidden = true },
					},
				},
			},
		},
	},
}
