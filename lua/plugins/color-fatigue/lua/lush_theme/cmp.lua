-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
-- local s = require("lush_theme._semantic")

return lush(function()
	return {
		CmpItemAbbr { fg = p.mono15 },
		CmpItemAbbrDeprecated { fg = p.mono11, gui = "strikethrough" },
		CmpItemAbbrMatch { fg = p.mono19 },
		CmpItemAbbrMatchFuzzy { fg = p.mono19 },
		CmpItemMenu { fg = p.mono11 },
		CmpItemKind { fg = p.mono11 },
		-- function
		CmpItemKindFunction { fg = p.mono21 },
		CmpItemKindStruct { CmpItemKindFunction },
		CmpItemKindClass { CmpItemKindFunction },
		CmpItemKindModule { CmpItemKindFunction },
		-- interface
		CmpItemKindInterface { fg = p.mono23 },
		CmpItemKindTypeParameter { CmpItemKindInterface },
		CmpItemKindValue { CmpItemKindInterface },
		CmpItemKindMethod { CmpItemKindInterface },
		CmpItemKindEnumMember { CmpItemKindInterface },
		-- keyword
		CmpItemKindKeyword { fg = p.mono17 },
		CmpItemKindOperator { CmpItemKindKeyword },
		CmpItemKindSnippet { CmpItemKindKeyword },
		CmpItemKindUnit { CmpItemKindKeyword },
		CmpItemKindFolder { CmpItemKindKeyword },
		-- constant
		CmpItemKindConstant { fg = p.acc_dim05 },
		CmpItemKindConstructor { CmpItemKindConstant },
		CmpItemKindReference { CmpItemKindConstant },
		-- text
		CmpItemKindText { fg = p.mono15 },
		CmpItemKindCopilot { CmpItemKindText },
		CmpItemKindEnum { CmpItemKindText },
		-- variable
		CmpItemKindVariable { fg = p.mono19 },
		CmpItemKindFile { CmpItemKindVariable },
		CmpItemKindColor { CmpItemKindVariable },
		-- field
		CmpItemKindField { fg = p.acc_dim02 },
		CmpItemKindProperty { CmpItemKindField },
		CmpItemKindEvent { CmpItemKindField },
	}
end)
