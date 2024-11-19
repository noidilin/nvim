return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		local color_fatigue = {
			normal = {
				a = { bg = "#1e1e1e", fg = "#878787", gui = "bold" },
				b = { bg = "#1e1e1e", fg = "#878787" },
				c = { bg = "#1e1e1e", fg = "#878787" },
			},
			insert = {
				a = { bg = "#414141", fg = "#b3b3b3", gui = "bold" },
				b = { bg = "#1e1e1e", fg = "#878787" },
				c = { bg = "#1e1e1e", fg = "#878787" },
			},
			command = {
				a = { bg = "#414141", fg = "#b3b3b3", gui = "bold" },
				b = { bg = "#1e1e1e", fg = "#878787" },
				c = { bg = "#1e1e1e", fg = "#878787" },
			},
			visual = {
				a = { bg = "#555555", fg = "#151515", gui = "bold" },
				b = { bg = "#1e1e1e", fg = "#878787" },
				c = { bg = "#1e1e1e", fg = "#878787" },
			},
			replace = {
				a = { bg = "#555555", fg = "#151515", gui = "bold" },
				b = { bg = "#1e1e1e", fg = "#878787" },
				c = { bg = "#1e1e1e", fg = "#878787" },
			},
			inactive = {
				a = { bg = "#151515", fg = "#414141", gui = "bold" },
				b = { bg = "#151515", fg = "#414141" },
				c = { bg = "#151515", fg = "#414141" },
			},
		}

		local opts = { options = { theme = color_fatigue } }
		return opts
	end,
}

-- local p = require("plugins.color-fatigue.lua.lush_theme.color") -- local file
-- local color_fatigue = {
--   normal = {
--     a = { bg = p.mono03, fg = p.mono17, gui = "bold" },
--     b = { bg = p.mono03, fg = p.mono17 },
--     c = { bg = p.mono03, fg = p.mono17 },
--   },
--   insert = {
--     a = { bg = p.mono15, fg = p.mono21, gui = "bold" },
--     b = { bg = p.mono03, fg = p.mono17 },
--     c = { bg = p.mono03, fg = p.mono17 },
--   },
--   command = {
--     a = { bg = p.mono15, fg = p.mono21, gui = "bold" },
--     b = { bg = p.mono03, fg = p.mono17 },
--     c = { bg = p.mono03, fg = p.mono17 },
--   },
--   visual = {
--     a = { bg = p.mono21, fg = p.mono00, gui = "bold" },
--     b = { bg = p.mono03, fg = p.mono17 },
--     c = { bg = p.mono03, fg = p.mono17 },
--   },
--   replace = {
--     a = { bg = p.mono21, fg = p.mono00, gui = "bold" },
--     b = { bg = p.mono03, fg = p.mono17 },
--     c = { bg = p.mono03, fg = p.mono17 },
--   },
--   inactive = {
--     a = { bg = p.mono01, fg = p.mono07, gui = "bold" },
--     b = { bg = p.mono01, fg = p.mono07 },
--     c = { bg = p.mono01, fg = p.mono07 },
--   },
-- }
