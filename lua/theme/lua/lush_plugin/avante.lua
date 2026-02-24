-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local h = lush.hsl
local p = require("lush_theme._primitive").hex
-- local s = require("lush_theme._semantic")

return lush(function()
	return {
		-- avante color
		-- avante title
		AvanteTitle { fg = p.accDim05, bg = p.mono05 }, -- title
		AvanteSubtitle { AvanteTitle }, -- selected code title
		AvanteThirdTitle { AvanteTitle }, -- prompt title
		AvanteReversedTitle { fg = p.mono05, bg = p.mono05 }, -- used for rounded border
		AvanteReversedSubtitle { AvanteReversedTitle }, -- used for rounded border
		AvanteReversedThirdTitle { AvanteReversedTitle }, -- used for rounded border
		-- avante conflict
		AvanteConflictCurrent { fg = p.mono21, bg = h(p.red00).darken(65), gui = "bold" }, -- current conflict
		AvanteConflictIncoming { fg = p.mono21, bg = h(p.green00).darken(65), gui = "bold" }, -- incoming conflict
		AvanteConflictCurrentLabel { fg = p.mono21, bg = h(p.red00).darken(50) }, -- current conflict label
		AvanteConflictIncomingLabel { fg = p.mono21, bg = h(p.green00).darken(50) }, -- incoming conflict label
		-- avante UI
		AvantePopupHint { fg = p.mono13 }, -- usage hints in popup menus
		AvanteInlineHint { fg = p.mono13, gui = "underline italic" }, -- the end of line hint displayed in visual model
		AvanteToBeDeleted { bg = h(p.red00).darken(30), gui = "strikethrough" },
		AvanteToBeDeletedWOStrikethrough { bg = h(p.red00).darken(30) },
		AvanteReversedNormal { fg = p.mono02, bg = p.mono16 },
		-- avante dialog
		AvanteConfirmTitle { fg = p.mono02, bg = p.red01 },
		AvanteButtonDefault { fg = p.mono02, bg = p.accDim05 },
		AvanteButtonDefaultHover { fg = p.mono02, bg = p.green01 },
		AvanteButtonPrimary { fg = p.mono02, bg = p.accDim05 },
		AvanteButtonPrimaryHover { fg = p.mono02, bg = p.accDim05 },
		AvanteButtonDanger { fg = p.mono02, bg = p.accDim05 },
		AvanteButtonDangerHover { fg = p.mono02, bg = p.red01 },
		-- avante state
		AvanteStateSpinnerGenerating { fg = p.mono02, bg = p.acc08 },
		AvanteStateSpinnerToolCalling { fg = p.mono02, bg = p.cyan01 },
		AvanteStateSpinnerFailed { fg = p.mono02, bg = p.red01 },
		AvanteStateSpinnerSucceeded { fg = p.mono02, bg = p.green01 },
		AvanteStateSpinnerSearching { fg = p.mono02, bg = p.acc08 },
		AvanteStateSpinnerThinking { fg = p.mono02, bg = p.acc08 },
		AvanteStateSpinnerCompacting { fg = p.mono02, bg = p.acc08 },
		AvanteTaskRunning { fg = p.acc08, bg_link = "Normal" },
		AvanteTaskCompleted { fg = p.green01, bg_link = "Normal" },
		AvanteTaskFailed { fg = p.red01, bg_link = "Normal" },
		AvanteThinking { fg = p.acc08, bg_link = "Normal" },
	}
end)
