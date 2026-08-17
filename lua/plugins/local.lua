return {
	{
		'noidilin/tuimux.nvim',
		enabled = false,
		dir = '/Users/noid/hub/dev/tuimux',
		dev = true,
		cmd = { 'Tuimux' },
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
