-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
-- local s = require("lush_theme._semantic")

return lush(function()
	return {
		-- Snacks Indent
		SnacksIndent { fg = p.mono07 },
		SnacksIndentScope { fg = p.mono13 },
		SnacksIndent1 { fg = p.mono11 },
		SnacksIndent2 { fg = p.mono10 },
		SnacksIndent3 { fg = p.mono09 },
		SnacksIndent4 { fg = p.mono08, gui = "bold" },
		SnacksIndent5 { fg = p.mono07 },
		SnacksIndent6 { fg = p.mono06 },
		SnacksIndent7 { fg = p.mono07 },
		SnacksIndent8 { fg = p.mono06, gui = "bold" },
	}
end)
