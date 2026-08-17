return {
	'folke/sidekick.nvim',
	opts = {
		-- add any options here
		cli = {
			win = {
				layout = 'right', ---@type "float"|"left"|"bottom"|"top"|"right"
				--- Options used when layout is "float"
				---@type vim.api.keyset.win_config
				float = {
					width = 0.9,
					height = 0.9,
				},
				-- Options used when layout is "left"|"bottom"|"top"|"right"
				---@type vim.api.keyset.win_config
				split = {
					width = 100, -- set to 0 for default split width
					height = 0, -- set to 0 for default split height
				},
			},
		},
	},
}
