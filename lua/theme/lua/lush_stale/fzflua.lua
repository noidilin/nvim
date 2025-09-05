-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
-- local s = require("lush_theme._semantic")

return lush(function()
	return {
		-- fzf-lua
		FzfLuaHeaderBind { fg = p.accDim07 },
		FzfLuaHeaderText { fg = p.mono23 },
		FzfLuaPathColNr { fg = p.mono11 },
		FzfLuaPathLineNr { fg = p.mono11 },
		FzfLuaLivePrompt { fg = p.acc05 },
		FzfLuaLiveSym { fg = p.acc05 },
		FzfLuaTabTitle { fg = p.mono15, gui = "bold" },
		FzfLuaTabMarker { fg = p.accDim05, gui = "bold" },
		FzfLuaBufFlagCur { fg = p.orange00 },
		FzfLuaBufFlagAlt { fg = p.yellow00 },
		FzfLuaBufNr { fg = p.accDim05 },
	}
end)
