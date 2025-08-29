-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
local s = require("lush_theme._semantic")
local c = require("lush_theme._component")

-- design system: component token
local component = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
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
		sym("@lsp.type.enumMember")(s._variable_member), -- @variable.member
		-- sym("@lsp.type.selfParameter") { Special },
		sym("@lsp.type.selfKeyword")(s._variable_builtin), -- @variable.builtin
		sym("@lsp.type.unresolvedReference")(s._error),

		-- Identifier
		-- sym("@lsp.type.variable")  { }, -- @constant
		-- sym("@lsp.type.builtinConstant")  { }, -- @constant.builtin
		-- sym("@lsp.type.parameter")  { }, -- @variable.parameter
		-- sym("@lsp.type.namespace")  { }, -- @module
		sym("@variable")(s._variable), -- any variable that does not have another highlight
		sym("@variable.builtin")(s._variable_builtin), -- variable names that are defined by the language, like 'this' or 'self'
		sym("@variable.member")(s._variable_member), -- fields
		sym("@variable.parameter")(s._parameter), -- parameters of a function
		sym("@constant")(s._constant), -- constants
		sym("@constant.builtin") { fg = p.mono17 }, -- constants that are defined by the language, like 'nil' in lua
		sym("@constant.macro")(s._preproc00), -- constants that are defined by macros like 'NULL' in c
		sym("@module")(s._constant), -- modules and namespace
		sym("@label")(s._block), -- for labels: label: in C and :label: in Lua
		--- type variable modifiers
		-- sym("@lsp.typemod.variable.defaultLibrary")  { }, -- @constant.builtin
		-- sym("@lsp.typemod.variable.definition")  { }, -- @property
		-- sym("@lsp.typemod.variable.injected") { c_variable },
		-- Literal
		sym("@lsp.type.number")(s._number),
		-- sym("@lsp.type.escapeSequence")  {  }, -- @string.escape
		sym("@string")(s._string), -- strings
		sym("@string.documentation")(s._comment), -- doc strings (Python docstrings)
		sym("@string.regexp")(s._special00), -- regex
		sym("@string.escape")(s._special02), -- escape characters within string
		sym("@string.special")(s._special01), -- other special strings (e.g. dates)
		sym("@string.special.path")(s._special01), -- filenames
		sym("@string.special.symbol")(s._variable), -- symbols or atoms
		sym("@string.special.url") { fg = p.mono22 }, -- urls, links, emails
		--- character
		sym("@character")(s._string), -- character literals
		sym("@character.special")(s._special01), -- special characters (e.g. wildcards)
		--- other
		sym("@boolean")(s._boolean), -- boolean
		sym("@number")(s._number), -- all numbers
		sym("@number.float")(s._number), -- float
		--- custom
		sym("@string.javascript")(s._none),
		-- Types
		-- sym("@lsp.type.generic")  { }, -- @type
		-- sym("@lsp.type.builtinType")  { }, -- @type.builtin
		-- sym("@lsp.type.typeAlias")  { }, -- @type.definition
		-- sym("@lsp.type.property")  { }, -- @type
		-- sym("@lsp.type.typeParameter") { Typedef },
		sym("@type")(s._type), -- types
		sym("@type.builtin") { fg = p.mono20 }, -- builtin types
		sym("@type.definition")(s._preproc00), -- type definitions (e.g. `typedef` in C)
		sym("@type.declaration") { fg = p.acc_dim05 },
		sym("@attribute")(s._constant), -- attributes, like <decorators> in python
		sym("@property")(s._property), -- same as TSField
		-- Functions
		sym("@lsp.type.operator")(s._operator),
		-- sym("@lsp.type.macro") { Macro },
		-- sym("@lsp.type.function")  { }, -- @function.call
		-- sym("@lsp.type.method")  { }, -- @function.method
		sym("@function")(s._function), -- function (calls and definitions)
		sym("@function.builtin")(s._special01), -- builtin functions: table.insert in Lua
		sym("@function.call") { fg = p.mono17 }, -- function calls
		sym("@function.macro")(s._preproc00), -- macro defined functions (calls and definitions): each macro_rules in Rust
		sym("@function.method") { fg = p.mono22 }, -- method definitions
		sym("@function.method.call") { fg = p.mono25 }, -- method calls
		sym("@constructor") { fg = p.acc_dim05 }, -- constructor calls and definitions: = { } in Lua, and Java constructors
		sym("@operator")(s._operator), -- any operator: +, but also -> and * in C
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
		sym("@lsp.type.keyword")(s._keyword),
		sym("@lsp.typemod.keyword.async")(s._coroutine), -- @keyword.coroutine
		--- treesitter
		sym("@keyword")(s._keyword), -- keywords that don't fall in previous categories
		sym("@keyword.modifier")(s._keyword), -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
		sym("@keyword.type")(s._keyword), -- keywords describing composite types (e.g. `struct`, `enum`, `class`)
		sym("@keyword.coroutine")(s._coroutine), -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		sym("@keyword.function")(s._preproc02), -- keywords used to define a function
		sym("@keyword.operator")(s._operator), -- keyword operator (eg, 'in' in python)
		sym("@keyword.import")(s._preproc00), -- includes: #include in C, use or extern crate in Rust, or require in Lua.		sym("@keyword.export") {  }, -- javascript & derivative
		sym("@keyword.repeat")(s._block), -- keywords related to loops
		sym("@keyword.return")(s._block),
		sym("@keyword.debug")(s._block), -- keywords related to debugging
		sym("@keyword.exception")(s._block),
		sym("@keyword.conditional")(s._block), -- keywords for conditional statements
		sym("@keyword.conditional.ternary")(s._operator), -- keywords for ternary operators (e.g. `?` / `:`)		sym("@conditional") { c_block }, -- Conditional
		sym("@keyword.directive")(s._preproc00), -- various preprocessor directives & shebangs
		sym("@keyword.directive.define")(s._preproc02), -- preprocessor definition directives
		sym("@keyword.export")(s._preproc00), -- javascript & derivative
		-- Punctuation
		-- sym("@lsp.type.formatSpecifier")  {  }, -- @punctuation.special
		sym("@punctuation")(s_special02),
		sym("@punctuation.delimiter")(s_special02), -- delimiters, like `; . , `
		sym("@punctuation.bracket")(s._special00), -- brackets and parentheses
		sym("@punctuation.special")(s._special01), -- punctuation that does not fall into above categories, like `{}` in string interpolation
		-- Comment
		-- sym("@lsp.type.comment") { c_comment },
		sym("@comment")(s._comment),
		sym("@comment.documentation")(s._comment), -- for comments documenting code
		sym("@comment.error")(c._danger),
		sym("@comment.warning")(c._warn),
		sym("@comment.hint")(c._success),
		sym("@comment.todo")(c._info),
		sym("@comment.note")(c._memo),
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
		sym("@tag")(s._tag), -- tags like html tag names
		sym("@tag.attribute")(s._attribute), -- tags like in html tag names
		sym("@tag.delimiter") { fg = p.mono11 }, -- tag delimiter < >
		--- custom
		sym("@tag.builtin")(s._tag), -- builtin tags (html)
		sym("@tag.javascript") { fg = p.mono25, gui = "bold" }, -- component
		-- Misc
		sym("@error")(s._error),
		sym("@none")(s._none),
		-- Markdown
		sym("@markup.heading.1.markdown")(s._md_h1),
		sym("@markup.heading.2.markdown")(s._md_h2),
		sym("@markup.heading.3.markdown")(s._md_h3),
		sym("@markup.heading.4.markdown")(s._md_h4),
		sym("@markup.heading.5.markdown")(s._md_h5),
		sym("@markup.heading.6.markdown")(s._md_h6),
		--[[
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
    --]]
	}
end)

return component
