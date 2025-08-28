return {
	"yetone/avante.nvim",
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		mode = "agentic",
		---@alias Provider "claude" | "openai" | "azure" | "gemini" | "vertex" | "cohere" | "copilot" | "bedrock" | "ollama" | string
		---@type Provider
		provider = "claude",
		providers = {
			deepseek = {
				__inherited_from = "moonshot",
				api_key_name = "DEEPSEEK_API_KEY",
				endpoint = "https://api.deepseek.com",
				model = "deepseek-coder",
				disable_tools = true,
			},
			deepseek_r1 = {
				__inherited_from = "moonshot",
				api_key_name = "DEEPSEEK_API_KEY",
				endpoint = "https://api.deepseek.com",
				model = "deepseek-reasoner",
				disable_tools = true,
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"folke/snacks.nvim", -- for input provider snacks
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = { file_types = { "markdown", "Avante" } },
			ft = { "markdown", "Avante" },
		},
		{
			"folke/which-key.nvim",
			opts = { spec = { { "<leader>a", group = "+avante", mode = { "n", "v" }, icon = { icon = "" } } } },
		},
	},
}
