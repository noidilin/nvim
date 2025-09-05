-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
-- local s = require("lush_theme._semantic")

return lush(function()
	return {
		-- telescope
		-- TelescopeBorder { FloatBorder },
		TelescopeMatching { fg = p.mono21, bg = p.mono05, gui = "bold" },
		TelescopePromptPrefix { fg = p.accDim05 },
		TelescopeSelection { fg = p.accDim05, bg = p.mono05 },
		TelescopeSelectionCaret { fg = p.mono25 },
		TelescopeResultsNormal { fg = p.mono15 },
	}
end)
