-- stylua: ignore
-- if true then return {} end

return {
	"yetone/avante.nvim",
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		mode = "legacy",
		---@alias Provider "claude" | "openai" | "azure" | "gemini" | "vertex" | "cohere" | "copilot" | "bedrock" | "ollama" | string
		---@type Provider
		provider = "claude",
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
