-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
local s = require("lush_theme._semantic")

-- design system: component token
return lush(function()
	return {
		-- Common vim syntax groups used for all kinds of code and markup.
		Keyword(s._keyword), --   any other keyword
		Typedef(s._preproc01), --   A typedef
		PreProc(s._preproc00), -- (*) Generic Preprocessor
		Include(s._preproc01), --   Preprocessor #include
		Define(s._preproc02), --   Preprocessor #define
		Macro(s._preproc02), --   Same as Define
		PreCondit(s._preproc00), --   Preprocessor #if, #else, #endif,
		Operator(s._operator), --   "sizeof", "+", "*",
		Special(s._special01), -- (*) Any special symbol
		SpecialChar(s._special02), --   Special character in a constant
		Constant(s._constant), -- (*) Any constant
		Character(s._special00), --   A character constant: 'c', '\n'
		Delimiter(s._special02), --   Character that needs attention
		String(s._string), --   A string constant: "this is a string"
		Boolean(s._boolean), --   A boolean constant: TRUE, false
		Number(s._number), --   A number constant: 234, 0xff
		Float(s._number), --   A floating point constant: 2.3e10
		Identifier(s._variable), -- (*) Any variable name
		Type(s._type), -- (*) int, long, char,
		StorageClass { fg = p.acc_dim05 }, --   static, register, volatile,
		Structure(s._constant), --   struct, union, enum,
		Function(s._function), --   Function name (also: methods for classes)
		Statement(s._block), -- (*) Any statement
		Conditional(s._block), --   if, then, else, endif, switch,
		Repeat(s._block), --   for, do, while,
		Label(s._block), --   case, default,
		Exception(s._block), --   try, catch, throw
		Error(s._error), -- Any erroneous construct
		Tag(s._tag), --   You can use CTRL-] on this
		Comment(s._comment), -- Any comment
		SpecialComment { fg = p.mono19 }, --   Special things inside a comment (e.g. '\n')
		Debug { fg = p.acc_dim05 }, --   Debugging statements
		DebugPC { fg = p.mono02, bg = p.mono16 },
		DebugBreakpoint { fg = p.mono02, bg = p.mono19 },
		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Todo { fg = p.mono22 }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
	}
end)
