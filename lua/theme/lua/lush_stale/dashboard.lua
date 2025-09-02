-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
-- local s = require("lush_theme._semantic")

return lush(function()
	return {
		-- DashboardHeader { FloatTitle },
		-- DashboardFooter { FloatFooter, gui = "italic" },
		DashboardShortCut { fg = p.acc_dim02 },
		-- DashboardIcon { NonText },
		-- DashboardDesc { NormalFloat },
		-- DashboardKey { NonText },
	}
end)
