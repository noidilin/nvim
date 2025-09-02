-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
-- local s = require("lush_theme._semantic")

return lush(function()
	return {
		-- neo tree
		-- NeoTreeNormal { Normal },
		-- NeoTreeNormalNC { NormalNC },
		-- NeoTreeDirectoryName { Normal },
		-- NeoTreeDirectoryIcon { Normal },
		-- NeoTreeRootName { NormalNC, gui = "bold" },
		NeoTreeFileNameOpened { fg = p.mono16 },
		NeoTreeModified { fg = p.mono19 },
		-- NeoTreeDimText { NonText }, -- text when not focus neo-tree
		-- NeoTreeFilterTerm { Search, gui = "bold" },
		-- NeoTreeFloatBorder { FloatBorder },
		-- NeoTreeFloatTitle { FloatTitle },
		-- neotree ui element
		NeoTreeTitleBar { fg = p.mono02 },
		-- NeoTreeVertSplit { VertSplit },
		-- NeoTreeWinSeparator { Winseparator },
		-- NeoTreeEndOfBuffer { EndOfBuffer },
		NeoTreeSymbolicLinkTarget { fg = p.acc02 },
		-- NeoTreeStatusLineNC { StatusLineNC },
		NeoTreeIndentMarker { fg = p.mono12 },
		-- NeoTreeExpander { Normal }, -- expand icon in front of directory
		-- neogree git status
		-- NeoTreeGitUntracked { NonText, gui = "italic" },
		-- NeoTreeGitIgnored { NonText, gui = "italic strikethrough" },
		-- NeoTreeGitAdded { Normal },
		NeoTreeGitModified { fg = p.mono19, gui = "bold" },
		NeoTreeGitDeleted { fg = p.orange00, gui = "strikethrough" },
		NeoTreeGitStaged { fg = p.green00 },
		NeoTreeGitUnstaged { fg = p.orange00 },
		NeoTreeGitConflict { fg = p.red00, gui = "bold italic" },
		-- neotree tab
		-- NeoTreeTabActive  { bg = active_bg, fg = C.lavender, style = { "bold" } },
		-- NeoTreeTabInactive  { bg = inactive_bg, fg = C.overlay0 },
		-- NeoTreeTabSeparatorActive  { fg = active_bg, bg = active_bg },
		-- NeoTreeTabSeparatorInactive  { fg = inactive_bg, bg = inactive_bg },
	}
end)
