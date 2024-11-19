return {
	"mrjones2014/smart-splits.nvim",
	lazy = false,
	keys = {
		-- [[ recommended mappings ]]
		-- resizing splits, these keymaps will also accept a range,
		---- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
		-- vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
		-- vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
		-- vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
		-- vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
		-- moving between splits
		-- vim.keymap.set('n', '<c-\\>', require('smart-splits').move_cursor_previous)

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
}
