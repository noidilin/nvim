return {
	{ 'ggandor/leap.nvim', enabled = false },
	{
		-- BUG: char mode in macro [bug: Weird behavior when using f in a macro](https://github.com/folke/flash.nvim/issues/379)
		'folke/flash.nvim',
		vscode = true,
		opts = {
			modes = { char = { enabled = false } },
		},
	},
	{
		'folke/sidekick.nvim',
		opts = {
			nes = { enabled = false },
		},
	},
	{
		'saghen/blink.cmp',
		opts = {
			keymap = { preset = 'default', ['<Up>'] = {}, ['<Down>'] = {} },
			sources = {
				providers = {
					snippets = {
						opts = {
							-- disable friendly-snippet frameworks, except for in rust.
							filter_snippets = function(ft, file)
								local disabled_fts = {
									javascript = true,
									javascriptreact = true, -- .jsx
									typescript = true,
									typescriptreact = true, -- .tsx
								}

								-- check if the snippet file path contains 'friendly-snippet' or 'javascript'
								if
									disabled_fts[ft]
									and string.match(file, 'friendly.snippets')
									and string.match(file, 'javascript')
								then
									return false
								end

								-- allow everything else by default
								return true
							end,
						},
					},
				},
			},
		},
	},
	{
		'nvim-mini/mini.move',
		event = 'VeryLazy',
		opts = {
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = '<M-Left>',
				right = '<M-Right>',
				down = '<M-Down>',
				up = '<M-Up>',
				-- Move current line in Normal mode
				line_left = '<M-Left>',
				line_right = '<M-Right>',
				line_down = '<M-Down>',
				line_up = '<M-Up>',
			},
		},
	},
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		dependencies = {
			{
				'folke/which-key.nvim',
				opts = {
					spec = {
						{ '<leader>1', hidden = true },
						{ '<leader>2', hidden = true },
						{ '<leader>3', hidden = true },
						{ '<leader>4', hidden = true },
						{ '<leader>5', hidden = true },
						{ '<leader>6', hidden = true },
						{ '<leader>7', hidden = true },
						{ '<leader>8', hidden = true },
						{ '<leader>9', hidden = true },
					},
				},
			},
		},
	},
}
