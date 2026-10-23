-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local h = lush.hsl
local primitive = require("lush_theme._primitive")
local p = primitive.hex
local light = primitive.is_light

return lush(function()
	return {
		-- Sidekick renders Copilot NES changes with syntax-colored virtual text.
		-- Use tinted, background-side fills so every syntax foreground remains legible.
		SidekickDiffAdd { bg = light and h(p.green00).lighten(65) or p.mono05 },
		SidekickDiffDelete { bg = light and h(p.red00).lighten(65) or h(p.red00).darken(65) },
		SidekickDiffContext { bg = p.mono05 },
	}
end)
