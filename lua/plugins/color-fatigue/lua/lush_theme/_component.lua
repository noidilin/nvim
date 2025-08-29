local p = require("lush_theme._primitive").hsl

-- design system: component token
return {
	_danger = { fg = p.mono12, bg = p.red00, gui = "italic" },
	_warn = { fg = p.mono12, bg = p.orange00, gui = "italic" },
	_success = { fg = p.mono12, bg = p.acc_dim02, gui = "italic" },
	_info = { fg = p.mono12, bg = p.mono15, gui = "italic" },
	_memo = { fg = p.mono12, bg = p.mono13, gui = "italic" },
}
