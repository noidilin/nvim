local p = require("lush_theme._primitive").hsl

-- design system: component token
return {
	errorBlock = { fg = p.mono12, bg = p.red00, gui = "bold" },
	warnBlock = { fg = p.mono12, bg = p.orange00 },
	infoBlock = { fg = p.mono12, bg = p.mono15, gui = "italic" },
	hintBlock = { fg = p.mono12, bg = p.acc05 },
	okBlock = { fg = p.mono12, bg = p.green00 },
}
