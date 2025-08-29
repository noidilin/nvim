return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		local p = require("plugins.color-fatigue.lua.lush_theme._primitive").hex
		local color_fatigue = {
			normal = {
				a = { bg = p.mono03, fg = p.mono17, gui = "bold" },
				b = { bg = p.mono03, fg = p.mono17 },
				c = { bg = p.mono03, fg = p.mono17 },
			},
			insert = {
				a = { bg = p.mono15, fg = p.mono21, gui = "bold" },
				b = { bg = p.mono03, fg = p.mono17 },
				c = { bg = p.mono03, fg = p.mono17 },
			},
			command = {
				a = { bg = p.mono15, fg = p.mono21, gui = "bold" },
				b = { bg = p.mono03, fg = p.mono17 },
				c = { bg = p.mono03, fg = p.mono17 },
			},
			visual = {
				a = { bg = p.mono21, fg = p.mono00, gui = "bold" },
				b = { bg = p.mono03, fg = p.mono17 },
				c = { bg = p.mono03, fg = p.mono17 },
			},
			replace = {
				a = { bg = p.mono21, fg = p.mono00, gui = "bold" },
				b = { bg = p.mono03, fg = p.mono17 },
				c = { bg = p.mono03, fg = p.mono17 },
			},
			inactive = {
				a = { bg = p.mono01, fg = p.mono07, gui = "bold" },
				b = { bg = p.mono01, fg = p.mono07 },
				c = { bg = p.mono01, fg = p.mono07 },
			},
		}

		return { options = { theme = color_fatigue } }
	end,
}
