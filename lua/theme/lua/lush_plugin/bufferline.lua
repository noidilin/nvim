-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
-- local s = require("lush_theme._semantic")

return lush(function()
	return {
		-- bufferline
		BufferLineFill { fg = p.mono02, bg = p.mono02 },
		BufferLineBackground { fg = p.mono11, bg = p.mono02 },
		BufferLineDuplicate { fg = p.mono09, bg = p.mono02 },
		BufferLineTruncMarker { fg = p.mono09, bg = p.mono02 },
		-- hint
		BufferLinePick { fg = p.mono01, bg = p.mono17 },
		BufferLinePickSelected { BufferLinePick },
		BufferLinePickVisible { BufferLinePick },
		-- separate
		BufferLineSeparator { fg = p.mono05, bg = p.mono02 },
		BufferLineOffsetSeparator { BufferLineSeparator },
		BufferLineTabSeparator { BufferLineSeparator },
		BufferLineTabSeparatorSelected { BufferLineSeparator },
		BufferLineSeparatorVisible { BufferLineSeparator },
		BufferLineSeparatorSelected { BufferLineSeparator },
		BufferLineGroupSeparator { BufferLineSeparator },
		BufferLineGroupLabel { fg = p.mono15, bg = p.mono03 },
		-- tabs
		BufferLineTab { fg = p.mono15, bg = p.mono02 },
		BufferLineTabClose { BufferLineTab },
		BufferLineTabSelected { BufferLinePick },
		-- selected
		BufferLineBufferSelected { fg = p.mono19, bg = p.mono02, gui = "bold" },
		BufferLineNumbersSelected { BufferLineBufferSelected },
		BufferLineModifiedSelected { fg = p.acc_dim02, bg = p.mono02, gui = "bold italic" },
		BufferLineIndicatorSelected { fg = p.mono17, bg = p.mono02 },
		BufferLineCloseButtonSelected { BufferLineIndicatorSelected },
		BufferLineDevIconDefaultSelected { BufferLineIndicatorSelected },
		---- lsp
		BufferLineErrorSelected { fg = p.red01, bg = p.mono02, gui = "bold italic" },
		BufferLineErrorDiagnosticSelected { fg = p.red00, bg = p.mono02, gui = "bold italic" },
		BufferLineHintSelected { fg = p.acc_dim05, bg = p.mono02, gui = "bold italic" },
		BufferLineHintDiagnosticSelected { fg = p.acc_dim02, bg = p.mono02, gui = "bold italic" },
		BufferLineInfoSelected { fg = p.mono21, bg = p.mono02, gui = "bold italic" },
		BufferLineInfoDiagnosticSelected { fg = p.mono17, bg = p.mono02, gui = "bold italic" },
		BufferLineWarningSelected { fg = p.orange01, bg = p.mono02, gui = "bold italic" },
		BufferLineWarningDiagnosticSelected { fg = p.orange00, bg = p.mono02, gui = "bold italic" },
		BufferLineDiagnosticSelected { fg = p.mono13, bg = p.mono02, gui = "bold italic" },
		---- mini icon
		BufferLineMiniIconsAzureSelected { fg = p.acc05, bg = p.mono02 },
		BufferLineMiniIconsBlueSelected { fg = p.blue01, bg = p.mono02 },
		BufferLineMiniIconsCyanSelected { fg = p.cyan01, bg = p.mono02 },
		BufferLineMiniIconsGreenSelected { fg = p.green01, bg = p.mono02 },
		BufferLineMiniIconsGreySelected { fg = p.mono22, bg = p.mono02 },
		BufferLineMiniIconsOrangeSelected { fg = p.orange01, bg = p.mono02 },
		BufferLineMiniIconsPurpleSelected { fg = p.magenta01, bg = p.mono02 },
		BufferLineMiniIconsRedSelected { fg = p.red01, bg = p.mono02 },
		BufferLineMiniIconsYellowSelected { fg = p.yellow01, bg = p.mono02 },
		-- visable
		BufferLineBufferVisible { fg = p.mono15, bg = p.mono02, gui = "italic" },
		BufferLineNumbersVisible { BufferLineBufferVisible },
		BufferLineModifiedVisible { fg = p.acc_dim02, bg = p.mono02 },
		BufferLineIndicatorVisible { fg = p.mono11, bg = p.mono02 },
		BufferLineCloseButtonVisible { BufferLineIndicatorVisible },
		BufferLineDevIconDefaultInactive { BufferLineIndicatorVisible },
		---- lsp
		BufferLineErrorVisible { fg = p.red00, bg = p.mono02 },
		BufferLineErrorDiagnosticVisible { BufferLineErrorVisible },
		BufferLineHintVisible { fg = p.acc_dim02, bg = p.mono02 },
		BufferLineHintDiagnosticVisible { BufferLineHintVisible },
		BufferLineInfoVisible { fg = p.mono17, bg = p.mono02 },
		BufferLineInfoDiagnosticVisible { BufferLineInfoVisible },
		BufferLineWarningVisible { fg = p.orange00, bg = p.mono02 },
		BufferLineWarningDiagnosticVisible { BufferLineWarningVisible },
		BufferLineDiagnosticVisible { fg = p.mono11, bg = p.mono02 },
		---- mini icon
		BufferLineMiniIconsAzureInactive { fg = p.acc_dim02, bg = p.mono02 },
		BufferLineMiniIconsBlueInactive { fg = p.blue00, bg = p.mono02 },
		BufferLineMiniIconsCyanInactive { fg = p.cyan00, bg = p.mono02 },
		BufferLineMiniIconsGreenInactive { fg = p.green00, bg = p.mono02 },
		BufferLineMiniIconsGreyInactive { fg = p.mono16, bg = p.mono02 },
		BufferLineMiniIconsOrangeInactive { fg = p.orange00, bg = p.mono02 },
		BufferLineMiniIconsPurpleInactive { fg = p.magenta00, bg = p.mono02 },
		BufferLineMiniIconsRedInactive { fg = p.red00, bg = p.mono02 },
		BufferLineMiniIconsYellowInactive { fg = p.yellow00, bg = p.mono02 },
		-- buffer (open but not visible)
		BufferLineBuffer { fg = p.mono11, bg = p.mono02 },
		BufferLineNumbers { BufferLineBuffer },
		BufferLineModified { BufferLineModifiedVisible },
		BufferLineCloseButton { fg = p.mono09, bg = p.mono02 },
		BufferLineDevIconDefault { BufferLineCloseButton },
		---- lsp
		BufferLineError { BufferLineErrorVisible },
		BufferLineErrorDiagnostic { BufferLineErrorDiagnosticVisible },
		BufferLineHint { BufferLineHintVisible },
		BufferLineHintDiagnostic { BufferLineHintDiagnosticVisible },
		BufferLineInfo { BufferLineInfoVisible },
		BufferLineInfoDiagnostic { BufferLineInfoDiagnosticVisible },
		BufferLineWarning { BufferLineWarningVisible },
		BufferLineWarningDiagnostic { BufferLineWarningDiagnosticVisible },
		BufferLineDiagnostic { BufferLineDiagnosticVisible },
		---- mini icon
		BufferLineMiniIconsAzure { BufferLineCloseButton },
		BufferLineMiniIconsBlue { BufferLineCloseButton },
		BufferLineMiniIconsCyan { BufferLineCloseButton },
		BufferLineMiniIconsGreen { BufferLineCloseButton },
		BufferLineMiniIconsGrey { BufferLineCloseButton },
		BufferLineMiniIconsOrange { BufferLineCloseButton },
		BufferLineMiniIconsPurple { BufferLineCloseButton },
		BufferLineMiniIconsRed { BufferLineCloseButton },
		BufferLineMiniIconsYellow { BufferLineCloseButton },
	}
end)
