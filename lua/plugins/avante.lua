-- cursor planning mode: https://github.com/yetone/avante.nvim/blob/main/cursor-planning-mode.md
-- deepseek vender: https://downmars.github.io/zh/posts/2025_02_18-avante.nvim_with_deepseek_api/
-- ref: https://github.com/yetone/avante.nvim/issues/1964

return {
	"yetone/avante.nvim",
	cmd = { "AvanteAsk", "AvanteChat", "AvanteEdit", "AvanteToggle" },
	-- version = "v0.0.23", -- HERE
	version = false, -- Never set this value to "*"! Never!
	opts = {
		-- NOTE: interaction mode.
		-- "agentic" uses tools to automatically generate code
		-- "legacy" uses the old planning method to generate code.

		---@alias Mode "agentic" | "legacy"
		mode = "legacy",
		---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
		provider = "claude",
		-- auto_suggestions_provider = "qwen",
		-- cursor_applying_provider = "groq",
		claude = {
			disable_tools = true,
		},
		vendors = {
			qwen = {
				__inherited_from = "openai",
				api_key_name = "",
				endpoint = "<redacted>",
				model = "qwen2.5-coder:7b",
				max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
			},
			llama = {
				__inherited_from = "openai",
				api_key_name = "",
				endpoint = "<redacted>",
				model = "llama3.2:3b",
				max_completion_tokens = 32768,
			},
			deepseek = {
				__inherited_from = "openai",
				api_key_name = "DEEPSEEK_API_KEY",
				endpoint = "https://api.deepseek.com",
				model = "deepseek-coder",
				disable_tools = true,
			},
			deepseek_r1 = {
				__inherited_from = "openai",
				api_key_name = "DEEPSEEK_API_KEY",
				endpoint = "https://api.deepseek.com",
				model = "deepseek-reasoner",
				disable_tools = true,
			},
			groq = {
				__inherited_from = "openai",
				api_key_name = "GROQ_API_KEY",
				endpoint = "https://api.groq.com/openai/v1/",
				model = "llama-3.3-70b-versatile",
				max_completion_tokens = 32768,
			},
		},
		behaviour = {
			auto_suggestions = false,
			-- enable_cursor_planning_mode = true,
		},
		repo_map = {
			ignore_patterns = { "%.git", "%.worktree", "__pycache__", "node_modules" },
		},
	},
	-- build = "make", -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
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
