return {
	"yetone/avante.nvim",
	cmd = { "AvanteAsk", "AvanteChat", "AvanteEdit", "AvanteToggle" },
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {
		---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
		provider = "claude", -- recommend using Claude
		claude = {
			endpoint = "https://api.anthropic.com",
			model = "claude-3-5-sonnet-20241022",
			temperature = 0,
			max_tokens = 4096,
		},
		openai = {
			endpoint = "https://api.openai.com/v1",
			model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
			timeout = 30000, -- timeout in milliseconds
			temperature = 0, -- adjust if needed
			max_tokens = 4096,
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- build = "make",
	build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		-- "ibhagwan/fzf-lua", -- for file_selector provider fzf
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = { file_types = { "markdown", "Avante" } },
			ft = { "markdown", "Avante" },
		},
		{
			"folke/which-key.nvim",
			opts = {
				spec = {
					{ "<leader>a", group = "+avante", mode = { "n", "v" }, icon = { icon = "" } },
					mode = { "n", "v" },
					{ "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "avante: ask", icon = { icon = "" } },
					{ "<leader>ac", "<cmd>AvanteChat<cr>", desc = "avante: chat codebase", icon = { icon = "" } },
					{ "<leader>ar", "<cmd>AvanteRefresh<cr>", desc = "avante: refresh", icon = { icon = "" } },
				},
			},
		},
	},
}
