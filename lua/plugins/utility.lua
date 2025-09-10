local leet_arg = "leetcode.nvim"

return {
	{
		"kawre/leetcode.nvim",
		lazy = leet_arg ~= vim.fn.argv()[1],
		build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"folke/snacks.nvim",
		},
		opts = { arg = leet_arg, lang = "javascript" },
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

			-- swapping buffers between windows
			{
				"g<leader>h",
				function()
					require("smart-splits").swap_buf_left()
				end,
				desc = "swap buffer left",
			},
			{
				"g<leader>j",
				function()
					require("smart-splits").swap_buf_down()
				end,
				desc = "swap buffer down",
			},
			{
				"g<leader>k",
				function()
					require("smart-splits").swap_buf_up()
				end,
				desc = "swap buffer up",
			},
			{
				"g<leader>l",
				function()
					require("smart-splits").swap_buf_right()
				end,
				desc = "swap buffer right",
			},
			-- resizing mode
			{
				"g<leader>s",
				function()
					require("smart-splits").start_resize_mode()
				end,
				desc = "resize mode",
			},
		},
	},
}
