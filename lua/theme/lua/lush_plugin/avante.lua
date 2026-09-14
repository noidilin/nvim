-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local h = lush.hsl
local primitive = require("lush_theme._primitive")
local p = primitive.hex
-- local s = require("lush_theme._semantic")

-- The conflict/deletion blocks are a tint of a diagnostic color sitting behind
-- body text. On the dark ramp that means darkening the chroma; on the light one
-- it has to go the other way, otherwise the fill ends up darker than the mono21
-- text on top of it (AvanteConflictCurrentLabel measured 1.03:1).
local function tint(hex, amount)
	if primitive.is_light then
		return h(hex).lighten(amount)
	end
	return h(hex).darken(amount)
end

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
		AvanteConflictCurrent { fg = p.mono21, bg = tint(p.red00, 65), gui = "bold" }, -- current conflict
		AvanteConflictIncoming { fg = p.mono21, bg = tint(p.green00, 65), gui = "bold" }, -- incoming conflict
		AvanteConflictCurrentLabel { fg = p.mono21, bg = tint(p.red00, 50) }, -- current conflict label
		AvanteConflictIncomingLabel { fg = p.mono21, bg = tint(p.green00, 50) }, -- incoming conflict label
		-- avante UI
		AvantePopupHint { fg = p.mono13 }, -- usage hints in popup menus
		AvanteInlineHint { fg = p.mono13, gui = "underline italic" }, -- the end of line hint displayed in visual model
		AvanteToBeDeleted { bg = tint(p.red00, 30), gui = "strikethrough" },
		AvanteToBeDeletedWOStrikethrough { bg = tint(p.red00, 30) },
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
