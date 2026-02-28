return {
	{
		'folke/which-key.nvim',
		opts = {
			spec = {
				{ 'ge', group = '+edit', mode = { 'n', 'v', 'x' }, icon = { icon = '' } },
				-- nvim-rip-substitute
				{ 'gef', mode = { 'n', 'x' }, desc = 'rip substitute', icon = { icon = '' } },
				-- treesj
				{ 'get', mode = { 'n' }, desc = 'split/join (ts)', icon = { icon = '󰊈' } },
				-- mini operator
				{ 'gem', mode = { 'n' }, desc = 'multiply operator', icon = { icon = '󰿈' } },
				{ 'ger', mode = { 'n' }, desc = 'replace operator', icon = { icon = '' } },
				{ 'gex', mode = { 'n' }, desc = 'exchange operator', icon = { icon = '' } },
				{ 'ges', mode = { 'n' }, desc = 'sort operator', icon = { icon = '' } },
				{ 'ge=', mode = { 'n' }, desc = 'evaluate operator', icon = { icon = '' } },
				{ 'gem', mode = { 'v' }, desc = 'multiply selection', icon = { icon = '󰿈' } },
				{ 'ger', mode = { 'v' }, desc = 'replace selection', icon = { icon = '' } },
				{ 'gex', mode = { 'v' }, desc = 'exchange selection', icon = { icon = '' } },
				{ 'ges', mode = { 'v' }, desc = 'sort selection', icon = { icon = '' } },
				{ 'ge=', mode = { 'v' }, desc = 'evaluate selection', icon = { icon = '' } },
			},
		},
	},
	-- { "johmsalas/text-case.nvim", event = "VeryLazy" },
	{
		-- WARN: searching/ replacing for line breaks (`\n` or `\r`) is not support. (issue #28)
		'chrisgrieser/nvim-rip-substitute',
		cmd = 'RipSubstitute',
		keys = { { 'gef', '<CMD>RipSubstitute<CR>', mode = { 'n', 'x' }, desc = 'rip substitute' } },
	},
	{
		'nvim-mini/mini.operators',
		event = 'VeryLazy',
		opts = {
			evaluate = { prefix = 'ge=', func = nil }, -- Evaluate text and replace with output
			exchange = { prefix = 'gex', reindent_linewise = true }, -- Exchange text regions
			multiply = { prefix = 'gem', func = nil }, -- Multiply (duplicate) text
			replace = { prefix = 'ger', reindent_linewise = true }, -- Replace text with register
			sort = { prefix = 'ges', func = nil }, -- Sort text
		},
	},
	{
		'Wansmer/treesj',
		cmd = 'TSJToggle',
		keys = { { 'get', '<CMD>TSJToggle<CR>', desc = 'split/join (treesitter)' } },
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = {
			use_default_keymaps = false,
		},
	},
}
