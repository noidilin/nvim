-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
-- local s = require("lush_theme._semantic")
local c = require("lush_theme._component")

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
		-- The base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticError(c.error),
		DiagnosticWarn(c.warn),
		DiagnosticInfo(c.info),
		DiagnosticHint(c.hint),
		DiagnosticOk(c.ok),
		-- For diagnostic virtual text
		-- DiagnosticVirtualTextError { DiagnosticError },
		-- DiagnosticVirtualTextWarn { DiagnosticWarn },
		-- DiagnosticVirtualTextInfo { DiagnosticInfo },
		-- DiagnosticVirtualTextHint { DiagnosticHint },
		-- DiagnosticVirtualTextOk { DiagnosticOk },
		-- To color diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingError    { } ,
		-- DiagnosticFloatingWarn     { } ,
		-- DiagnosticFloatingInfo     { } ,
		-- DiagnosticFloatingHint     { } ,
		-- DiagnosticFloatingOk       { } ,
		-- For signs in sign column
		-- DiagnosticSignError        { } ,
		-- DiagnosticSignWarn         { } ,
		-- DiagnosticSignInfo         { } ,
		-- DiagnosticSignHint         { } ,
		-- DiagnosticSignOk           { } ,
		-- To underline diagnostics
		DiagnosticUnderlineError { DiagnosticError, gui = "underline" },
		DiagnosticUnderlineWarn { DiagnosticWarn, gui = "underline" },
		DiagnosticUnderlineInfo { DiagnosticInfo, gui = "underline" },
		DiagnosticUnderlineHint { DiagnosticHint, gui = "underline" },
		DiagnosticUnderlineOk { DiagnosticOk, gui = "underline" },

		TroubleText { fg = p.mono19 },
		TroubleCount { fg = p.red00, bg = p.mono05 },
		TroubleNormal { fg = p.mono17, bg = p.mono02 },
	}
end)
