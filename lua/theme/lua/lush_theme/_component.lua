local p = require("lush_theme._primitive").hex

-- design system: component token
return {
	error = { fg = p.red00, gui = "bold" },
	warn = { fg = p.orange00 },
	info = { fg = p.mono15, gui = "italic" },
	hint = { fg = p.mono09 },
	ok = { fg = p.green00 },
	errorBlock = { fg = p.mono12, bg = p.red00, gui = "bold" },
	warnBlock = { fg = p.mono12, bg = p.orange00 },
	infoBlock = { fg = p.mono12, bg = p.mono15, gui = "italic" },
	hintBlock = { fg = p.mono12, bg = p.mono09 },
	okBlock = { fg = p.mono12, bg = p.green00 },
	-- TODO: add diff text/background
}
