-- Since this is a lua file, vim will append it to the runtime,
-- which means you can require(...) it in other lua code (this is useful),
-- but you should also take care not to conflict with other libraries.
--
-- This is a lua quirk, as it has somewhat poor support for namespacing.
-- name your file: "super_theme/lua/lush_theme/super_theme_dark.lua",
-- not: "super_theme/lua/dark.lua".

-- Enable lush.ify on this file, run: `:Lushify`

local lush = require("lush")
local hsl = lush.hsl
local p = require("lush_theme.color")

-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	-- An empty definition `{}` will clear all styling, leaving elements looking like 'Normal' group
	-- To be able to link to a group, it must already be defined, so you may have to reorder items as you go
	return {
		-- Custom group for theme file
		c_variable { fg = p.mono17 },
		c_variable_builtin { fg = p.acc07, gui = "italic" },
		c_variable_member { fg = p.mono20 },
		c_parameter { fg = p.mono17, gui = "bold underline" },
		c_constant { fg = p.acc_dim05 },
		c_namespace { fg = p.mono25, gui = "underline" },

		c_string { fg = p.mono15 },
		c_regexp { fg = p.mono15 },
		c_boolean { fg = p.mono17 },
		c_number { fg = p.mono17 },

		c_type { fg = p.mono25 },
		c_property { fg = p.acc_dim02, gui = "italic" },
		c_attribute { fg = p.mono14 },

		c_function { fg = p.mono22 },
		c_method { fg = p.mono22, gui = "italic" },
		c_coroutine { fg = p.acc07 },
		c_operator { fg = p.mono19 },

		c_interface { fg = p.mono25 },
		c_class { fg = p.mono17 },
		c_event { fg = p.acc_dim02, gui = "underline" },

		c_keyword { fg = p.mono25 },
		c_block { fg = p.mono19, gui = "bold" },
		c_error { fg = p.red00, gui = "bold" },
		c_none { fg = p.mono11 },

		c_tag { fg = p.mono25 },
		c_comment { fg = p.mono12, gui = "italic" },

		c_md_h1 { fg = p.mono25, gui = "bold underline" },
		c_md_h2 { fg = p.mono24, gui = "bold underline" },
		c_md_h3 { fg = p.mono23, gui = "bold" },
		c_md_h4 { fg = p.mono22 },
		c_md_h5 { fg = p.mono21 },
		c_md_h6 { fg = p.mono21, gui = "italic" },

		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight groups. See :h highlight-groups
		ColorColumn { bg = p.mono05 }, -- Columns set with 'colorcolumn'
		Conceal { fg = p.mono22, bg = p.mono02 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor { gui = "reverse" }, -- Character under the cursor
		CurSearch { fg = p.mono16, bg = p.mono07 or p.mono05 }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		vCursor { gui = "reverse" },
		iCursor { gui = "reverse" },
		lCursor { gui = "reverse" }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM { gui = "reverse" }, -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn { bg = p.mono03 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine { bg = p.mono03 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory { fg = p.acc02 }, -- Directory names (and other special names in listings)
		DiffAdd { fg = p.green00 }, -- Diff mode: Added line |diff.txt|
		DiffChange { fg = p.yellow00 }, -- Diff mode: Changed line |diff.txt|
		DiffDelete { fg = p.red00 }, -- Diff mode: Deleted line |diff.txt|
		DiffText { fg = p.mono16 }, -- Diff mode: Changed text within a changed line |diff.txt|
		DiffAdded { fg = p.green00 },
		DiffRemoved { fg = p.red00 },
		DiffFile { fg = p.mono19 },
		DiffIndexLine { fg = p.mono12 },
		EndOfBuffer { fg = p.mono12 }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		Terminal { fg = p.mono16, bg = p.mono02 },
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		ErrorMsg { fg = p.red00, gui = "bold" }, -- Error messages on the command line
		VertSplit { fg = p.mono07 }, -- Column separating vertically split windows
		Folded { fg = p.mono12, bg = p.mono02 }, -- Line used for closed folds
		FoldColumn { fg = p.mono12, bg = p.mono02 }, -- 'foldcolumn'
		SignColumn { fg = p.mono16, bg = p.mono02 }, -- Column where |signs| are displayed
		IncSearch { fg = p.mono02, bg = p.mono10 or p.mono07 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute { fg = p.mono25, bg = p.mono07 }, -- |:substitute| replacement text highlighting
		LineNr { fg = p.mono12 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr { fg = p.mono16 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen { fg = p.mono16, bg = p.mono05, gui = "underline" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg { fg = p.mono22, gui = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline, don't set this highlight because of https://github.com/neovim/neovim/issues/17832
		MsgSeparator { fg = p.mono16, bg = p.mono05, gui = "bold" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg { fg = p.mono22, gui = "bold" }, -- |more-prompt|
		NonText { fg = p.mono10 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal { fg = p.mono16, bg = p.mono02 }, -- Normal text
		NormalNC { fg = p.mono12 }, -- normal text in non-current windows
		NormalFloat { fg = p.mono16, bg = p.mono02 }, -- Normal text in floating windows.
		FloatBorder { fg = p.mono09, bg = p.mono02 }, -- Border of floating windows.
		FloatTitle { fg = p.mono16, bg = p.mono02 }, -- Title of floating windows.
		FloatFooter { fg = p.mono09, bg = p.mono02 },
		Pmenu { fg = p.mono16, bg = p.mono03 }, -- Popup menu: Normal item.
		PmenuSel { bg = p.mono04, gui = "bold" }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		PmenuSbar { bg = p.mono03 }, -- Popup menu: Scrollbar.
		PmenuThumb { bg = p.mono03 }, -- Popup menu: Thumb of the scrollbar.
		Question { fg = p.acc_dim05 }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine { fg = p.mono22, gui = "underline" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search { fg = p.mono16, bg = p.mono10 or p.mono07 }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey { fg = p.mono12 }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad { sp = p.red00, gui = "underline" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap { sp = p.orange00, gui = "underline" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal { sp = p.yellow00, gui = "underline" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare { sp = p.yellow00, gui = "underline" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine { fg = p.mono16, bg = p.mono12 }, -- Status line of current window
		StatusLineTerm { fg = p.mono16, bg = p.mono05 },
		StatusLineNC { fg = p.mono12, bg = p.mono02 }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTermNC { fg = p.mono12, bg = p.mono05 },
		TabLine { fg = p.mono16, bg = p.mono05 }, -- Tab pages line, not active tab page label
		TabLineFill { fg = p.mono12, bg = p.mono05 }, -- Tab pages line, where there are no labels
		TabLineSel { fg = p.mono02, bg = p.mono16 }, -- Tab pages line, active tab page label
		ToolbarButton { fg = p.mono02, bg = p.mono07 },
		ToolbarLine { fg = p.mono16 },
		Title { fg = p.acc_dim02 }, -- Titles for output from ":set all", ":autocmd"
		Visual { fg = p.mono16, bg = p.mono07 }, -- Visual mode selection
		VisualNOS { bg = p.mono12, gui = "underline" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg { fg = p.orange00, gui = "bold" }, -- Warning messages
		Whitespace { fg = p.mono07 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator { fg = p.mono07 }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu { fg = p.mono02, bg = p.mono22 }, -- Current match in 'wildmenu' completion
		WinBar { fg = p.mono04 }, -- Window bar of current window
		WinBarNC { fg = p.mono04 }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- See :h group-name
		Comment { c_comment }, -- Any comment

		Identifier { c_variable }, -- (*) Any variable name
		Constant { c_constant }, -- (*) Any constant

		String { c_string }, --   A string constant: "this is a string"
		Character { c_string }, --   A character constant: 'c', '\n'
		Number { c_number }, --   A number constant: 234, 0xff
		Boolean { c_boolean }, --   A boolean constant: TRUE, false
		Float { c_number }, --   A floating point constant: 2.3e10

		Type { fg = p.mono25 }, -- (*) int, long, char,
		StorageClass { fg = p.acc_dim05 }, --   static, register, volatile,
		Structure { fg = p.acc_dim05 }, --   struct, union, enum,
		Typedef { fg = p.acc_dim05 }, --   A typedef

		Function { c_function }, --   Function name (also: methods for classes)
		Operator { c_operator }, --   "sizeof", "+", "*",

		Keyword { c_keyword }, --   any other keyword
		Statement { c_block }, -- (*) Any statement
		Conditional { c_block }, --   if, then, else, endif, switch,
		Repeat { c_block }, --   for, do, while,
		Label { c_block }, --   case, default,
		Exception { c_block }, --   try, catch, throw

		PreProc { fg = p.acc_dim05 }, -- (*) Generic Preprocessor
		Include { fg = p.mono19 }, --   Preprocessor #include
		Define { fg = p.mono25 }, --   Preprocessor #define
		Macro { fg = p.acc_dim05 }, --   Same as Define
		PreCondit { fg = p.mono12 }, --   Preprocessor #if, #else, #endif,

		Special { fg = p.mono20 }, -- (*) Any special symbol
		SpecialChar { fg = p.mono19 }, --   Special character in a constant
		Tag { c_tag }, --   You can use CTRL-] on this
		Delimiter { fg = p.mono21 }, --   Character that needs attention
		SpecialComment { fg = p.mono19 }, --   Special things inside a comment (e.g. '\n')

		Debug { fg = p.acc_dim05 }, --   Debugging statements
		DebugPC { fg = p.mono02, bg = p.mono16 },
		DebugBreakpoint { fg = p.mono02, bg = p.mono19 },

		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error { c_error }, -- Any erroneous construct
		Todo { fg = p.mono22 }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- Tree-Sitter syntax groups. See :h treesitter-highlight-groups
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be specially handled to be valid lua code.
		-- We do this via the special sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym"@text.literal"
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- LSP
		-- sym("@lsp.type.interface") { Structure },
		-- sym("@lsp.type.class") { Structure },
		-- sym("@lsp.type.enum") { Structure },
		sym("@lsp.type.enumMember") { c_variable_member }, -- @variable.member
		-- sym("@lsp.type.selfParameter") { Special },
		sym("@lsp.type.selfKeyword") { c_variable_builtin }, -- @variable.builtin
		-- sym("@lsp.type.unresolvedReference") { c_error },

		-- Identifier
		-- sym("@lsp.type.variable")  { }, -- @constant
		-- sym("@lsp.type.builtinConstant")  { }, -- @constant.builtin
		-- sym("@lsp.type.parameter")  { }, -- @variable.parameter
		-- sym("@lsp.type.namespace")  { }, -- @module
		sym("@variable") { c_variable }, -- any variable that does not have another highlight
		sym("@variable.builtin") { c_variable_builtin }, -- variable names that are defined by the language, like 'this' or 'self'
		sym("@variable.member") { c_variable_member }, -- fields
		sym("@variable.parameter") { c_parameter }, -- parameters of a function

		sym("@constant") { c_constant }, -- constants
		sym("@constant.builtin") { fg = p.mono17 }, -- constants that are defined by the language, like 'nil' in lua
		sym("@constant.macro") { Macro }, -- constants that are defined by macros like 'NULL' in c

		sym("@module") { Constant }, -- modules and namespace
		sym("@label") { Label }, -- for labels: label: in C and :label: in Lua

		--- type variable modifiers
		-- sym("@lsp.typemod.variable.defaultLibrary")  { }, -- @constant.builtin
		-- sym("@lsp.typemod.variable.definition")  { }, -- @property
		-- sym("@lsp.typemod.variable.injected") { c_variable },

		-- Literal
		sym("@lsp.type.number") { c_number },
		-- sym("@lsp.type.escapeSequence")  {  }, -- @string.escape
		sym("@string") { c_string }, -- strings
		sym("@string.documentation") { c_comment }, -- doc strings (Python docstrings)
		sym("@string.regexp") { SpecialChar }, -- regex
		sym("@string.escape") { SpecialChar }, -- escape characters within string
		sym("@string.special") { SpecialChar }, -- other special strings (e.g. dates)
		sym("@string.special.path") { SpecialChar }, -- filenames
		sym("@string.special.symbol") { Identifier }, -- symbols or atoms
		sym("@string.special.url") { fg = p.mono22 }, -- urls, links, emails
		--- character
		sym("@character") { c_string }, -- character literals
		sym("@character.special") { SpecialChar }, -- special characters (e.g. wildcards)
		--- other
		sym("@boolean") { c_boolean }, -- boolean
		sym("@number") { c_number }, -- all numbers
		sym("@number.float") { c_number }, -- float
		--- custom
		sym("@string.javascript") { c_none },

		-- Types
		-- sym("@lsp.type.generic")  { }, -- @type
		-- sym("@lsp.type.builtinType")  { }, -- @type.builtin
		-- sym("@lsp.type.typeAlias")  { }, -- @type.definition
		-- sym("@lsp.type.property")  { }, -- @type
		-- sym("@lsp.type.typeParameter") { Typedef },
		sym("@type") { Type }, -- types
		sym("@type.builtin") { fg = p.mono20 }, -- builtin types
		sym("@type.definition") { Typedef }, -- type definitions (e.g. `typedef` in C)
		sym("@type.declaration") { fg = p.acc_dim05 },

		sym("@attribute") { Constant }, -- attributes, like <decorators> in python
		sym("@property") { c_property }, -- same as TSField

		-- Functions
		sym("@lsp.type.operator") { c_operator },
		-- sym("@lsp.type.macro") { Macro },
		-- sym("@lsp.type.function")  { }, -- @function.call
		-- sym("@lsp.type.method")  { }, -- @function.method
		sym("@function") { c_function }, -- function (calls and definitions)
		sym("@function.builtin") { Special }, -- builtin functions: table.insert in Lua
		sym("@function.call") { fg = p.mono17 }, -- function calls
		sym("@function.macro") { Macro }, -- macro defined functions (calls and definitions): each macro_rules in Rust
		sym("@function.method") { fg = p.mono22 }, -- method definitions
		sym("@function.method.call") { fg = p.mono25 }, -- method calls

		sym("@constructor") { fg = p.acc_dim05 }, -- constructor calls and definitions: = { } in Lua, and Java constructors
		sym("@operator") { c_operator }, -- any operator: +, but also -> and * in C

		--- type function modifiers
		-- sym("@lsp.typemod.function")  { }, -- @function.call
		-- sym("@lsp.typemod.function.defaultLibrary")  { }, -- @function.builtin
		-- sym("@lsp.typemod.function.builtin")  { }, -- @function.builtin
		-- sym("@lsp.typemod.function.definition")  { }, -- @function
		-- sym("@lsp.typemod.class.defaultLibrary") {}, -- @type.builtin
		-- sym("@lsp.typemod.enum.defaultLibrary") {}, -- @type.builtin
		-- sym("@lsp.typemod.enumMember.defaultLibrary") {}, -- @constant.builtin
		-- sym("@lsp.typemod.macro.defaultLibrary") {}, -- @function.builtin
		-- sym("@lsp.typemod.method.defaultLibrary") {}, -- @function.builtin
		-- sym("@lsp.typemod.operator.injected") { c_operator },
		-- sym("@lsp.typemod.string.injected") { c_string },
		-- sym("@lsp.typemod.type.defaultLibrary") {}, -- @type.builtin

		-- Keywords
		--- LSP
		sym("@lsp.type.keyword") { c_keyword },
		sym("@lsp.typemod.keyword.async") { c_coroutine }, -- @keyword.coroutine
		--- treesitter
		sym("@keyword") { c_keyword }, -- keywords that don't fall in previous categories
		sym("@keyword.modifier") { c_keyword }, -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
		sym("@keyword.type") { c_keyword }, -- keywords describing composite types (e.g. `struct`, `enum`, `class`)
		sym("@keyword.coroutine") { c_coroutine }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		sym("@keyword.function") { Define }, -- keywords used to define a function
		sym("@keyword.operator") { c_operator }, -- keyword operator (eg, 'in' in python)
		sym("@keyword.import") { PreProc }, -- includes: #include in C, use or extern crate in Rust, or require in Lua.		sym("@keyword.export") {  }, -- javascript & derivative
		sym("@keyword.repeat") { c_block }, -- keywords related to loops
		sym("@keyword.return") { c_block },
		sym("@keyword.debug") { c_block }, -- keywords related to debugging
		sym("@keyword.exception") { c_block },

		sym("@keyword.conditional") { c_block }, -- keywords for conditional statements
		sym("@keyword.conditional.ternary") { c_operator }, -- keywords for ternary operators (e.g. `?` / `:`)		sym("@conditional") { c_block }, -- Conditional

		sym("@keyword.directive") { PreProc }, -- various preprocessor directives & shebangs
		sym("@keyword.directive.define") { Define }, -- preprocessor definition directives

		sym("@keyword.export") { PreProc }, -- javascript & derivative

		-- Punctuation
		-- sym("@lsp.type.formatSpecifier")  {  }, -- @punctuation.special
		sym("@punctuation") { Delimiter },
		sym("@punctuation.delimiter") { Delimiter }, -- delimiters, like `; . , `
		sym("@punctuation.bracket") { fg = p.mono16 }, -- brackets and parentheses
		sym("@punctuation.special") { SpecialChar }, -- punctuation that does not fall into above categories, like `{}` in string interpolation

		-- Comment
		-- sym("@lsp.type.comment") { c_comment },
		sym("@comment") { c_comment },
		sym("@comment.documentation") { c_comment }, -- for comments documenting code
		sym("@comment.error") { c_comment, bg = p.red00 },
		sym("@comment.warning") { c_comment, bg = p.orange00 },
		sym("@comment.hint") { c_comment, bg = p.acc_dim02 },
		sym("@comment.todo") { c_comment, bg = p.mono15 },
		sym("@comment.note") { c_comment, bg = p.mono13 },

		-- Markup
		sym("@markup") { fg = p.mono16 }, -- text in markup language
		sym("@markup.strong") { fg = p.mono16, gui = "bold" }, -- bold
		sym("@markup.italic") { fg = p.mono16, gui = "italic" }, -- italic
		sym("@markup.underline") { fg = p.mono16, gui = "underline" }, -- underline
		sym("@markup.strikethrough") { fg = p.mono12, gui = "strikethrough" }, -- strikethrough
		sym("@markup.heading") { fg = p.mono19 }, -- markdown titles
		sym("@markup.math") { fg = p.mono15 }, -- math environments, like `$$` in latex
		sym("@markup.quote") { fg = p.mono12 }, -- quotes with >
		sym("@markup.environment") { fg = p.mono12 }, -- text environments of markup languages
		sym("@markup.environment.name") { fg = p.mono12 }, -- text indicating the type of an environment
		sym("@markup.link") { fg = p.mono15 }, -- text references, footnotes, citations, etc
		sym("@markup.link.label") { fg = p.mono15, gui = "underline" }, -- link, reference, descriptions
		sym("@markup.link.url") { fg = p.mono15, gui = "underline" }, -- urls, links, emails
		sym("@markup.raw") { fg = p.acc_dim05 }, -- inline code in markdown, and for doc in python (""")
		sym("@markup.list") { fg = p.mono22 },
		sym("@markup.list.checked") { fg = p.mono22 }, -- todo checked
		sym("@markup.list.unchecked") { fg = p.mono22 }, -- todo unchecked

		-- Diff
		sym("@diff.plus") { fg = p.green00 }, -- added text (diff files)
		sym("@diff.minus") { fg = p.red00 }, -- removed text (diff files)
		sym("@diff.delta") { fg = p.yellow00 }, -- changed text (diff files)

		-- Tags
		sym("@tag") { c_tag }, -- tags like html tag names
		sym("@tag.attribute") { c_attribute }, -- tags like in html tag names
		sym("@tag.delimiter") { fg = p.mono11 }, -- tag delimiter < >
		--- custom
		sym("@tag.builtin") { c_tag }, -- builtin tags (html)
		sym("@tag.javascript") { c_tag, gui = "bold" }, -- component

		-- Misc
		sym("@error") { c_error },
		sym("@none") { c_none },

		-- Markdown
		sym("@markup.heading.1.markdown") { c_md_h1 },
		sym("@markup.heading.2.markdown") { c_md_h2 },
		sym("@markup.heading.3.markdown") { c_md_h3 },
		sym("@markup.heading.4.markdown") { c_md_h4 },
		sym("@markup.heading.5.markdown") { c_md_h5 },
		sym("@markup.heading.6.markdown") { c_md_h6 },

		-- -- css
		-- sym("@property.css") { fg = C.lavender },
		-- sym("@property.id.css") { fg = C.blue },
		-- sym("@property.class.css") { fg = C.yellow },
		-- sym("@type.css") { fg = C.lavender },
		-- sym("@type.tag.css") { fg = C.mauve },
		-- sym("@string.plain.css") { fg = C.peach },
		-- sym("@number.css") { fg = C.peach },
		-- -- toml
		-- sym("@property.toml") { fg = C.blue }, -- Differentiates between string and properties
		-- -- json
		-- sym("@label.json") { fg = C.blue }, -- For labels: label: in C and :label: in Lua.
		-- -- lua
		-- sym("@constructor.lua") { fg = C.flamingo }, -- For constructor calls and definitions: = { } in Lua.
		-- -- typescript
		-- sym("@property.typescript") { fg = C.lavender, style = O.styles.properties or {} },
		-- sym("@constructor.typescript") { fg = C.lavender },
		-- -- TSX (Typescript React)
		-- sym("@constructor.tsx") { fg = C.lavender },
		-- sym("@tag.attribute.tsx") { fg = C.teal, style = O.styles.miscs or { "italic" } },
		-- -- yaml
		-- sym("@variable.member.yaml") { fg = C.blue }, -- For fields.
		-- -- C/CPP
		-- sym("@type.builtin.c") { fg = C.yellow, style = {} },
		-- sym("@property.cpp") { fg = C.text },
		-- sym("@type.builtin.cpp") { fg = C.yellow, style = {} },
		-- -- gitcommit
		-- sym("@comment.warning.gitcommit") { fg = C.yellow },
		-- -- gitignore
		-- sym("@string.special.path.gitignore") { fg = C.text },

		-- Legacy highlights

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
		DiagnosticInfo { fg = p.yellow00, fmt = "italic" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint { fg = p.acc02 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk { fg = p.green00 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticVirtualTextError { fg = p.red00, gui = "bold" }, -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn { fg = p.orange00 }, -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo { fg = p.acc02 }, -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint { fg = p.acc02 }, -- Used for "Hint" diagnostic virtual text.
		DiagnosticVirtualTextOk { fg = p.green00 }, -- Used for "Ok" diagnostic virtual text.
		-- TODO: what is sp
		DiagnosticUnderlineError { gui = "underline", sp = p.red00 }, -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn { gui = "underline", sp = p.yellow00 }, -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo { gui = "underline", sp = p.acc02 }, -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint { gui = "underline", sp = p.acc02 }, -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk { gui = "underline", sp = p.green00 }, -- Used to underline "Ok" diagnostics.
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

		-- cmp
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

		-- gitsigns
		GitSignsAdd { fg = p.green00 },
		GitSignsAddLn { fg = p.green00 },
		GitSignsAddNr { fg = p.green00 },
		GitSignsChange { fg = p.yellow00 },
		GitSignsChangeLn { fg = p.yellow00 },
		GitSignsChangeNr { fg = p.yellow00 },
		GitSignsDelete { fg = p.red00 },
		GitSignsDeleteLn { fg = p.red00 },
		GitSignsDeleteNr { fg = p.red00 },

		-- neo tree
		NeoTreeNormal { Normal },
		NeoTreeNormalNC { NormalNC },
		NeoTreeDirectoryName { Normal },
		NeoTreeDirectoryIcon { Normal },
		NeoTreeRootName { NormalNC, gui = "bold" },
		NeoTreeFileNameOpened { fg = p.mono16 },
		NeoTreeModified { fg = p.mono19 },
		NeoTreeDimText { NonText }, -- text when not focus neo-tree
		NeoTreeFilterTerm { Search, gui = "bold" },
		NeoTreeFloatBorder { FloatBorder },
		NeoTreeFloatTitle { FloatTitle },
		-- neotree ui element
		NeoTreeTitleBar { fg = p.mono02 },
		NeoTreeVertSplit { VertSplit },
		NeoTreeWinSeparator { Winseparator },
		NeoTreeEndOfBuffer { EndOfBuffer },
		NeoTreeSymbolicLinkTarget { fg = p.acc02 },
		NeoTreeStatusLineNC { StatusLineNC },
		NeoTreeIndentMarker { fg = p.mono12 },
		NeoTreeExpander { Normal }, -- expand icon in front of directory
		-- neogree git status
		NeoTreeGitUntracked { NonText, gui = "italic" },
		NeoTreeGitIgnored { NonText, gui = "italic strikethrough" },
		NeoTreeGitAdded { Normal },
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

		-- telescope
		TelescopeBorder { FloatBorder },
		TelescopeMatching { fg = p.mono21, bg = p.mono05, gui = "bold" },
		TelescopePromptPrefix { fg = p.acc_dim05 },
		TelescopeSelection { fg = p.acc_dim05, bg = p.mono05 },
		TelescopeSelectionCaret { fg = p.mono25 },
		TelescopeResultsNormal { fg = p.mono15 },

		-- flash
		FlashBackdrop { fg = p.mono10 },
		FlashCurrent { fg = p.mono01, bg = p.mono17, gui = "bold" },
		FlashLabel { fg = p.acc07, gui = "bold" },
		FlashMatch { fg = p.acc_dim02, bg = p.mono05, gui = "underline" },
		FlashCursor { gui = "reverse" },

		-- yanky
		YankyYanked { fg = p.acc07, bg = p.mono10 },
		YankyPut { fg = p.acc07, bg = p.mono10 },

		-- markdown render
		--- icons
		RenderMarkdownH1 { c_md_h1 },
		RenderMarkdownH2 { c_md_h2 },
		RenderMarkdownH3 { c_md_h3 },
		RenderMarkdownH4 { c_md_h4 },
		RenderMarkdownH5 { c_md_h5 },
		RenderMarkdownH6 { c_md_h6 },
		--- background line
		RenderMarkdownH1Bg { c_md_h1 },
		RenderMarkdownH2Bg { c_md_h2 },
		RenderMarkdownH3Bg { c_md_h3 },
		RenderMarkdownH4Bg { c_md_h4 },
		RenderMarkdownH5Bg { c_md_h5 },
		RenderMarkdownH6Bg { c_md_h6 },
		-- code block
		RenderMarkdownCode { bg = p.mono03 }, -- code block background
		RenderMarkdownCodeInline { bg = p.mono03 }, -- inline code background
		RenderMarkdownMath { bg = p.mono03 }, -- LaTeX lines
		--- symbol
		RenderMarkdownBullet { fg = p.mono13 }, -- list item bullet points
		RenderMarkdownQuote { fg = p.mono13 }, -- block quote marker
		RenderMarkdownDash { fg = p.mono06 }, -- thematic break line
		--- link
		RenderMarkdownWikiLink { fg = p.mono19 }, -- wiki link icon & text
		RenderMarkdownLink { fg = p.acc_dim02 }, -- image & hyperlink icons
		--- table
		-- RenderMarkdownTableHead {  },
		-- RenderMarkdownTableRow {  },
		-- RenderMarkdownTableFill {  },
		--- checkbox
		-- RenderMarkdownChecked {  },
		-- RenderMarkdownUnchecked {  },
		-- RenderMarkdownTodo {  },

		-- dashboard
		DashboardHeader { FloatTitle },
		DashboardFooter { FloatFooter, gui = "italic" },
		-- dashboard doom (used by lazy vim)
		DashboardShortCut { fg = p.acc_dim02 },
		DashboardIcon { NonText },
		DashboardDesc { NormalFloat },
		DashboardKey { NonText },

		-- neo test
		NeotestTest { fg = p.mono15 },
		NeotestUnknown { fg = p.mono15 },
		NeotestDir { fg = p.mono12 },
		NeotestFile { fg = p.acc_dim05 },
		NeotestPassed { fg = p.green00 },
		NeotestFailed { fg = p.red00 },
		NeotestMarked { fg = p.yellow00 },
		NeotestWatching { fg = p.orange00 },
		NeotestTarget { fg = p.mono22 },
		NeotestFocused { fg = p.acc02, gui = "bold" },
		NeotestRunning { fg = p.acc02 },
		NeotestAdapterName { fg = p.mono22, gui = "bold" },
		NeotestNamespace { fg = p.mono17 },
		NeotestSkipped { fg = p.orange00 },
		NeotestIndent { fg = p.mono12 },

		-- avante color
		-- avante UI
		AvanteTitle { fg = p.acc_dim05, bg = p.mono05 }, -- title
		AvanteReversedTitle { fg = p.mono05 }, -- used for rounded border
		AvanteSubtitle { AvanteTitle }, -- selected code title
		AvanteReversedSubtitle { AvanteReversedTitle }, -- used for rounded border
		AvanteThirdTitle { AvanteTitle }, -- prompt title
		AvanteReversedThirdTitle { AvanteReversedTitle }, -- used for rounded border
		-- avante conflict
		AvanteConflictCurrent { fg = p.mono21, bg = p.green00, gui = "bold" },
		AvanteConflictIncoming { fg = p.mono21, bg = p.yellow00, gui = "bold" },
		AvanteConflictAncestor { fg = p.mono21, bg = p.mono15, gui = "bold" },
		-- AvanteConflictCurrentLabel  {}, -- current shade = 60
		-- AvanteConflictIncomingLabel  {}, -- incoming shade = 60
		-- AvanteConflictAncestorLabel  {}, -- ancestor shade = 60
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
