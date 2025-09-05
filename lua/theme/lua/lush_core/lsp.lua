-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
-- local s = require("lush_theme._semantic")

return lush(function()
	return {
		-- Native LSP client and diagnostic system. LSP clients may use these groups or their own.
		-- See :h lsp-highlight
		LspReferenceText { bg = p.mono05 }, -- Used for highlighting "text" references
		LspReferenceRead { LspReferenceText }, -- Used for highlighting "read" references
		LspReferenceWrite { LspReferenceText }, -- Used for highlighting "write" references
		LspCodeLens { fg = p.mono12, gui = "italic" }, -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		LspCodeLensSeparator { fg = p.mono12 }, -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
		LspCxxHlGroupEnumConstant { fg = p.mono25 },
		LspCxxHlGroupMemberVariable { fg = p.mono25 },
		LspCxxHlGroupNamespace { fg = p.mono22 },
		LspCxxHlSkippedRegion { fg = p.mono12 },
		LspCxxHlSkippedRegionBeginEnd { fg = p.mono19 },

		-- See :h diagnostic-highlights
		DiagnosticError { fg = p.red00, gui = "bold" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn { fg = p.orange00 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo { fg = p.mono15, gui = "italic" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint { fg = p.acc05 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk { fg = p.green00 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { DiagnosticError }, -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn { DiagnosticWarn }, -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo { DiagnosticInfo }, -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint { DiagnosticHint }, -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk { DiagnosticOk }, -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError { DiagnosticError, gui = "bold underline" }, -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn { DiagnosticWarn, gui = "underline" }, -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo { DiagnosticInfo, gui = "italic underline" }, -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint { DiagnosticHint, gui = "underline" }, -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk { DiagnosticOk, gui = "underline" }, -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.
		TroubleText { fg = p.mono19 },
		TroubleCount { fg = p.red00, bg = p.mono05 },
		TroubleNormal { fg = p.mono17, bg = p.mono02 },
	}
end)
