return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = { ensure_installed = { 'powershell' } },
	},
	{
		'cordx56/rustowl',
		version = '*', -- Latest stable version
		build = 'cargo binstall rustowl', -- cargo-binstall is needed
		lazy = false, -- This plugin is already lazy
		opts = function(_, opts)
			local p = require('theme.lua.lush_theme._primitive').hex
			opts = {
				colors = {
					lifetime = p.green00,
					imm_borrow = p.blue00,
					mut_borrow = p.magenta00,
					move = p.orange00,
					call = p.yellow00,
					outlive = p.red00,
				},
			}

			return opts
		end,
	},
	{
		'mason-org/mason.nvim',
		opts = {
			ensure_installed = {
				'powershell-editor-services',
			},
		},
	},
	{
		'TheLeoP/powershell.nvim',
		opts = {
			bundle_path = vim.fn.stdpath('data') .. '/mason/packages/powershell-editor-services',
		},
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = { 'DrKJeff16/wezterm-types' },
		opts = {
			servers = {
				tailwindcss = {
					settings = {
						tailwindCSS = {
							classFunctions = { 'cn', 'cva', 'clsx', 'twMerge' },
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								library = { vim.fn.stdpath('data') .. '/lazy/wezterm-types/lua' },
							},
						},
					},
				},
			},
		},
	},
}
