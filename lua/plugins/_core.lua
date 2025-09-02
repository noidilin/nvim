return {
	{
		"saghen/blink.cmp",
		opts = {
			-- set to {} to disable a keymap from preset
			keymap = { preset = "default", ["<Up>"] = {}, ["<Down>"] = {} },
		},
	},
	{
		-- BUG: char mode in macro
		-- [bug: unexpected result when using `f` in macro when `multi_line = false`](https://github.com/folke/flash.nvim/issues/310)
		-- [bug: broken macros when using 'f' character jump](https://github.com/folke/flash.nvim/issues/366)
		-- [bug: Weird behavior when using f in a macro](https://github.com/folke/flash.nvim/issues/379)
		"folke/flash.nvim",
		opts = {
			modes = {
				char = { enabled = false },
			},
		},
	},
	{
		"echasnovski/mini.move",
		event = "VeryLazy",
		opts = {
			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<M-Left>",
				right = "<M-Right>",
				down = "<M-Down>",
				up = "<M-Up>",
				-- Move current line in Normal mode
				line_left = "<M-Left>",
				line_right = "<M-Right>",
				line_down = "<M-Down>",
				line_up = "<M-Up>",
			},
		},
	},
}
