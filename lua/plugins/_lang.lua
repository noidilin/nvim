return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "powershell" } },
	},
	{
		"mason-org/mason.nvim",
		opts = { ensure_installed = { "powershell-editor-services" } },
	},
	{
		"TheLeoP/powershell.nvim",
		opts = {
			bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "DrKJeff16/wezterm-types" },
		opts = {
			servers = {
				tailwindcss = {
					settings = {
						tailwindCSS = {
							classFunctions = { "cn", "cva", "clsx", "twMerge" },
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							workspace = { library = { vim.fn.stdpath("data") .. "/lazy/wezterm-types/lua" } },
						},
					},
				},
			},
		},
	},
}
