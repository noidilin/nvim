return {
	{ 'nvzone/showkeys', cmd = 'ShowkeysToggle', opts = { maxkeys = 5 } },
	-- { "nvzone/minty", cmd = { "Shades", "Huefy" }, dependencies = { "nvzone/volt" } },
	{ 'wakatime/vim-wakatime', lazy = false },
	{
		'atiladefreitas/dooing',
		init = function()
			vim.g.loaded_dooing = 1
		end,
		dependencies = {
			{
				'folke/which-key.nvim',
				opts = {
					spec = { { '<leader>m', group = '+dooing', icon = { icon = '' } } },
				},
			},
		},
		config = function(_, opts)
			require('dooing').setup(opts)
		end,
		opts = {
			notes = { icon = '' },
			due_notifications = { on_startup = true },
			keymaps = {
				toggle_window = '<leader>mD', -- Toggle global todos
				open_project_todo = '<leader>md', -- Toggle project-specific todos
				show_due_notification = '<leader>mN', -- Show due items window
				create_nested_task = 'n',
				toggle_priority = 'x',
			},
		},
	},
}
