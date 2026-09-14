local primitive = require("lush_theme._primitive")
local p = primitive.hex
local light = primitive.is_light

-- The `*Block` groups put text on a filled background, so the fg has to sit at
-- the opposite end of the ramp from the fill. `mono12` works over the dark
-- variant's fills, but in light it is #9f9f9f on #9b5f5f -- 1.89:1. So pick the
-- end by variant. Every `or` branch below is the original dark value, so the
-- dark theme renders byte-identically to before.
--   on_fill -- over a saturated fill (red / orange / green / mono15)
--   on_pale -- over the pale mono09 fill, which needs the *text* end instead
local on_fill = light and p.mono02 or p.mono12
local on_pale = light and p.mono21 or p.mono12

-- mono09 is a surface token, so as a plain fg it is only 1.24:1 on the light
-- base. (It is 1.6:1 in dark too, but that is pre-existing -- left alone.)
local hint_fg = light and p.mono13 or p.mono09

-- design system: component token
return {
	error = { fg = p.red00, gui = "bold" },
	warn = { fg = p.orange00 },
	info = { fg = p.mono15, gui = "italic" },
	hint = { fg = hint_fg },
	ok = { fg = p.green00 },
	errorBlock = { fg = on_fill, bg = p.red00, gui = "bold" },
	warnBlock = { fg = on_fill, bg = p.orange00 },
	infoBlock = { fg = on_fill, bg = p.mono15, gui = "italic" },
	hintBlock = { fg = on_pale, bg = p.mono09 },
	okBlock = { fg = on_fill, bg = p.green00 },
	-- TODO: add diff text/background
}
