-- stylua: ignore
if true then return {} end

return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			strategies = { chat = { adapter = "anthropic" } },
			opts = { log_level = "DEBUG" },
		},
	},
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>uM",
				function()
					require("precognition").toggle()
				end,
				desc = "toggle motion hint",
			},
		},
		opts = { startVisible = false },
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				harper_ls = {
					enabled = true,
					settings = {
						["harper-ls"] = {
							linters = {
								SentenceCapitalization = false,
								-- SpellCheck = false,
							},
							markdown = {
								IgnoreLinkTitle = false,
							},
						},
					},
				},
			},
		},
	},
}
