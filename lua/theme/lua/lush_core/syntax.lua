-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
local s = require("lush_theme._semantic")

-- design system: component token
return lush(function()
	return {
		Comment(s._comment), -- Any comment
		SpecialComment { fg = p.mono19 }, --   Special things inside a comment (e.g. '\n')
		Constant(s._constant), -- (*) Any constant
		String(s._string), --   A string constant: "this is a string"
		Character(s._special00), --   A character constant: 'c', '\n'
		Number(s._number), --   A number constant: 234, 0xff
		Float(s._number), --   A floating point constant: 2.3e10
		Boolean(s._boolean), --   A boolean constant: TRUE, false
		Identifier(s._variable), -- (*) Any variable name
		Function(s._function), --   Function name (also: methods for classes)
		Statement(s._block), -- (*) Any statement
		Conditional(s._block), --   if, then, else, endif, switch,
		Repeat(s._block), --   for, do, while,
		Label(s._block), --   case, default,
		Operator(s._operator), --   "sizeof", "+", "*",
		Keyword(s._keyword), --   any other keyword
		Exception(s._block), --   try, catch, throw

		PreProc(s._preproc00), -- (*) Generic Preprocessor
		Include(s._preproc01), --   Preprocessor #include
		Define(s._preproc02), --   Preprocessor #define
		Macro(s._preproc02), --   Same as Define
		PreCondit(s._preproc00), --   Preprocessor #if, #else, #endif,

		StorageClass { fg = p.accDim05 }, --   static, register, volatile,
		Structure(s._constant), --   struct, union, enum,
		Special(s._special01), -- (*) Any special symbol
		Type(s._type), -- (*) int, long, char,
		Typedef(s._preproc01), --   A typedef
		SpecialChar(s._special02), --   Special character in a constant
		Tag(s._tag), --   You can use CTRL-] on this
		Delimiter(s._special02), --   Character that needs attention

		Error(s._error), -- Any erroneous construct
		Todo { fg = p.mono22 }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		Debug { fg = p.accDim05 }, --   Debugging statements
		DebugPC { fg = p.mono02, bg = p.mono16 },
		DebugBreakpoint { fg = p.mono02, bg = p.mono19 },

		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)

		DiffAdded { fg = p.green00 },
		DiffRemoved { fg = p.red00 },
		DiffChanged { fg = p.yellow00 },
		DiffNewFile { fg = p.mono23 },
		DiffOldFile { fg = p.mono15 },
		DiffFile { fg = p.mono19 },
		DiffLine { fg = p.mono09 },
		DiffIndexLine { fg = p.mono13 },
		-- background: darken diff
		DiffAdd { bg = p.green00.darken(65) }, -- Diff mode: Added line |diff.txt|
		DiffDelete { bg = p.red00.darken(65) }, -- Diff mode: Deleted line |diff.txt|
		DiffChange { bg = p.mono05 }, -- Diff mode: Changed line |diff.txt|
		DiffText { bg = p.mono05 }, -- Diff mode: Changed text within a changed line |diff.txt|
	}
end)
