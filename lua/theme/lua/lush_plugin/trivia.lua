-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
-- local s = require("lush_theme._semantic")

return lush(function()
	return {
		-- git sign
		GitSignsAdd { fg = p.green00 },
		GitSignsAddLn { fg = p.green00 },
		GitSignsAddNr { fg = p.green00 },
		GitSignsChange { fg = p.yellow00 },
		GitSignsChangeLn { fg = p.yellow00 },
		GitSignsChangeNr { fg = p.yellow00 },
		GitSignsDelete { fg = p.red00 },
		GitSignsDeleteLn { fg = p.red00 },
		GitSignsDeleteNr { fg = p.red00 },
		-- flash
		FlashBackdrop { fg = p.mono10 },
		FlashCurrent { fg = p.mono01, bg = p.mono17, gui = "bold" },
		FlashLabel { fg = p.acc07, gui = "bold" },
		FlashMatch { fg = p.acc_dim02, bg = p.mono05, gui = "underline" },
		FlashCursor { gui = "reverse" },
		-- yanky
		YankyYanked { fg = p.acc07, bg = p.mono10 },
		YankyPut { fg = p.acc07, bg = p.mono10 },
		-- grug-far
		GrugFarResultsChangeIndicator { fg = p.red00 },
		GrugFarResultsRemoveIndicator { fg = p.red00 },
		GrugFarResultsAddIndicator { fg = p.green00 },
	}
end)
