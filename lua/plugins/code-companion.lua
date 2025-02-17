return {
	"olimorris/codecompanion.nvim",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		strategies = {
			-- Change the default chat adapter
			chat = {
				adapter = "anthropic",
			},
		},
		opts = {
			-- Set debug logging
			log_level = "DEBUG",
		},
	},
}
