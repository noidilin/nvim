local leet_arg = 'leetcode'

return {
	'kawre/leetcode.nvim',
	lazy = leet_arg ~= vim.fn.argv()[1],
	build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
		'folke/snacks.nvim',
		{
			'folke/which-key.nvim',
			opts = {
				spec = {
					{ '<leader>Q', group = 'leetcode', icon = { icon = '󰺢' } },
					{ '<leader>Qm', mode = { 'n' }, icon = { icon = '󰍜' } },
					{ '<leader>Qx', mode = { 'n' }, icon = { icon = '󰈆', color = 'red' } },
					{ '<leader>Qc', mode = { 'n' }, icon = { icon = '' } },
					{ '<leader>Qi', mode = { 'n' }, icon = { icon = '󰋽' } },
					{ '<leader>Qy', mode = { 'n' }, icon = { icon = '' } },
					{ '<leader>Qt', mode = { 'n' }, icon = { icon = '', color = 'red' } },
					{ '<leader>Qs', mode = { 'n' }, icon = { icon = '', color = 'red' } },
					{ '<leader>Ql', mode = { 'n' }, icon = { icon = '' } },
					{ '<leader>Qo', mode = { 'n' }, icon = { icon = '󰈔' } },
					{ '<leader>Qr', mode = { 'n' }, icon = { icon = '󰜉' } },
				},
			},
		},
	},
	keys = {
		{ '<leader>Qm', '<cmd>Leet menu<cr>', desc = 'menu' },
		{ '<leader>Qx', '<cmd>Leet exit<cr>', desc = 'exit' },
		{ '<leader>Qc', '<cmd>Leet console<cr>', desc = 'console' },
		{ '<leader>Qi', '<cmd>Leet info<cr>', desc = 'info' },
		{ '<leader>Qy', '<cmd>Leet yank<cr>', desc = 'yank' },
		{ '<leader>Qt', '<cmd>Leet test<cr>', desc = 'test' },
		{ '<leader>Qs', '<cmd>Leet submit<cr>', desc = 'submit' },
		{ '<leader>Ql', '<cmd>Leet list<cr>', desc = 'list' },
		{ '<leader>Qo', '<cmd>Leet open<cr>', desc = 'open' },
		{ '<leader>Qr', '<cmd>Leet reset<cr>', desc = 'reset' },
	},
	opts = function(_, opts)
		local p = require('theme.lua.lush_theme._primitive').hex
		opts = {
			arg = leet_arg,
			lang = 'python3',
			storage = {
				home = vim.fs.joinpath(vim.fn.expand('~'), 'hub', 'leet'),
			},
			editor = {
				reset_previous_code = false,
			},
			injector = {
				golang = { before = 'package main' },
			},
			theme = {
				['case_focus_ok'] = {
					fg = p.mono25,
					bg = p.green00,
					bold = true,
				},
				['case_focus_err'] = {
					fg = p.mono25,
					bg = p.red00,
					bold = true,
				},
			},
		}

		return opts
	end,
}
