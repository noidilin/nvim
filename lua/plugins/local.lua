return {
	{
		'noidilin/jjui.nvim',
		dir = '/Users/noid/hub/dev/jjui.nvim',
		dev = true,
		cmd = { 'Jjui' },
		keys = {
			{ '<leader>jj', '<cmd>Jjui toggle<cr>', desc = 'toggle jjui' },
			{ '<leader>jc', '<cmd>Jjui cwd<cr>', desc = 'open jjui in cwd' },
		},
		opts = {
			window = {
				width = 0.9,
				height = 0.9,
				border = 'rounded',
			},
		},
	},
}
