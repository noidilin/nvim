-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
-- local s = require("lush_theme._semantic")

return lush(function()
	return {
		-- neo test
		NeotestTest { fg = p.mono15 },
		NeotestUnknown { fg = p.mono15 },
		NeotestDir { fg = p.mono12 },
		NeotestFile { fg = p.accDim05 },
		NeotestPassed { fg = p.green00 },
		NeotestFailed { fg = p.red00 },
		NeotestMarked { fg = p.yellow00 },
		NeotestWatching { fg = p.orange00 },
		NeotestTarget { fg = p.mono22 },
		NeotestFocused { fg = p.acc02, gui = "bold" },
		NeotestRunning { fg = p.acc02 },
		NeotestAdapterName { fg = p.mono22, gui = "bold" },
		NeotestNamespace { fg = p.mono17 },
		NeotestSkipped { fg = p.orange00 },
		NeotestIndent { fg = p.mono12 },
	}
end)
