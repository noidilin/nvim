-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl
local s = require("lush_theme._semantic")
local c = require("lush_theme._component")

return lush(function(injected_functions)
	-- For more information see https://github.com/rktjmp/lush.nvim/issues/109
	local sym = injected_functions.sym
	return {
		-- Identifiers
		sym("@variable")(s._variable), -- various variable names that does not have another highlight
		sym("@variable.builtin")(s._variable_builtin), -- built-in variable names (e.g. `this` \ 'self')
		sym("@variable.parameter")(s._parameter), -- parameters of a function
		-- sym("@variable.parameter.builtin")(s._parameter), -- special parameters (e.g. `_`, `it`)
		sym("@variable.member")(s._variable_member), -- object and struct fields
		sym("@constant")(s._constant), -- constant identifiers
		sym("@constant.builtin") { fg = p.mono17 }, -- built-in constant values  (e.g. `nil` in lua)
		sym("@constant.macro")(s._preproc00), -- constants defined by preprocessor (e.g. `NULL` in c)
		sym("@module")(s._constant), -- modules and namespace
		sym("@module.builtin")(s._constant), -- built-in modules and namespace
		sym("@label")(s._block), -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

		-- LSP semantic tokens - high-value only
		sym("@lsp.type.unresolvedReference")(s._error), -- unresolved imports/references
		sym("@lsp.modifier.readonly") { fg = p.accDim05, gui = "italic" }, -- immutable bindings
		sym("@lsp.modifier.deprecated") { fg = p.mono12, gui = "strikethrough" }, -- deprecated symbols

		-- Literals
		sym("@string")(s._string), -- string literals
		sym("@string.documentation")(s._comment), -- string documenting code (e.g. Python docstrings)
		sym("@string.regexp")(s._special00), -- regular expressions
		sym("@string.escape")(s._special02), -- escape characters within string
		sym("@string.special")(s._special01), -- other special strings (e.g. dates)
		sym("@string.special.symbol")(s._variable), -- symbols or atoms
		sym("@string.special.url") { fg = p.mono22 }, -- URIs (e.g. hyperlinks)
		sym("@string.special.path")(s._special01), -- filenames
		sym("@character")(s._string), -- character literals
		sym("@character.special")(s._special01), -- special characters (e.g. wildcards)
		sym("@boolean")(s._boolean), -- boolean literals
		sym("@number")(s._number), -- numeric literals
		sym("@number.float")(s._number), -- floating-point number literals

		-- Types
		sym("@type")(s._type), -- type or class definitions and annotations
		sym("@type.builtin") { fg = p.mono20 }, -- builtin types
		sym("@type.definition")(s._preproc00), -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
		sym("@type.declaration") { fg = p.accDim05 },
		sym("@attribute")(s._constant), -- attribute annotations (e.g. Python decorators, Rust lifetimes)
		sym("@attribute.builtin")(s._constant), -- builtin annotations (e.g. `@property` in Python)
		sym("@property")(s._property), -- the key in key/value pairs

		-- TypeScript-specific LSP tokens
		sym("@lsp.type.interface.typescript") { fg = p.acc07, gui = "bold" }, -- interface declarations
		sym("@lsp.type.type.typescript") { fg = p.mono23, gui = "italic" }, -- type aliases
		sym("@lsp.type.typeParameter") { fg = p.accDim02, gui = "italic" }, -- generic parameters <T>
		sym("@lsp.type.decorator") { fg = p.yellow00, gui = "bold" }, -- @Component, @Injectable

		-- Rust-specific LSP tokens
		sym("@lsp.type.lifetime.rust") { fg = p.green00, gui = "italic" }, -- 'a, 'static lifetimes
		sym("@lsp.type.trait.rust") { fg = p.acc07, gui = "underline" }, -- trait definitions
		sym("@lsp.modifier.mutable.rust") { fg = p.red00, gui = "bold" }, -- mut bindings
		sym("@lsp.type.macro.rust") { fg = p.mono19, gui = "bold" }, -- macro invocations
		sym("@lsp.modifier.attribute.rust") { fg = p.mono14, gui = "italic" }, -- #[derive(...)]

		-- Functions
		sym("@function")(s._function), -- function definitions
		sym("@function.builtin")(s._special01), -- builtin functions: table.insert in Lua
		sym("@function.call") { fg = p.mono17 }, -- function calls
		sym("@function.macro")(s._preproc00), -- macro defined functions (calls and definitions): each macro_rules in Rust
		sym("@function.method") { fg = p.mono22 }, -- method definitions
		sym("@function.method.call") { fg = p.mono25 }, -- method calls
		sym("@constructor") { fg = p.accDim05 }, -- constructor calls and definitions: = { } in Lua, and Java constructors
		sym("@operator")(s._operator), -- any symbolic operator (e.g. `+` / `*`), but also -> and * in C

		-- Function-related LSP tokens
		sym("@lsp.modifier.async") { fg = p.acc07, gui = "italic" }, -- async functions
		sym("@lsp.type.selfKeyword.rust") { fg = p.accDim05, gui = "bold italic" }, -- self parameter in Rust

		-- Keywords
		sym("@keyword")(s._keyword), -- keywords not fitting into specific categories
		sym("@keyword.coroutine")(s._coroutine), -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		sym("@keyword.function")(s._preproc02), -- keywords that define a function (e.g. `func` in Go, `def` in Python)
		sym("@keyword.operator")(s._operator), -- operators that are English words (e.g. `and` / `or` / `in`)
		sym("@keyword.import")(s._preproc00), -- keywords for including or exporting modules (e.g. `import` / `from` in Python)
		sym("@keyword.export")(s._preproc00), -- javascript & derivative
		sym("@keyword.type")(s._keyword), -- keywords describing namespaces and composite types (e.g. `struct`, `enum`)
		sym("@keyword.modifier")(s._keyword), -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
		sym("@keyword.repeat")(s._block), -- keywords related to loops (e.g. `for` / `while`)
		sym("@keyword.return")(s._block), -- keywords like `return` and `yield`
		sym("@keyword.debug")(s._block), -- keywords related to debugging
		sym("@keyword.exception")(s._block), -- keywords related to exceptions (e.g. `throw` / `catch`)
		sym("@keyword.conditional")(s._block), -- keywords related to conditionals (e.g. `if` / `else`)
		sym("@keyword.conditional.ternary")(s._operator), -- keywords for ternary operators (e.g. `?` / `:`)
		sym("@keyword.directive")(s._preproc00), -- various preprocessor directives & shebangs
		sym("@keyword.directive.define")(s._preproc02), -- preprocessor definition directives

		-- Punctuation
		sym("@punctuation")(s._special02),
		sym("@punctuation.delimiter")(s._special02), -- delimiters (e.g. `;` / `.` / `,`)
		sym("@punctuation.bracket")(s._special00), -- brackets (e.g. `()` / `{}` / `[]`)
		sym("@punctuation.special")(s._special01), -- punctuation doesn't fall into above categories, like `{}` in string interpolation

		-- Comment
		sym("@comment")(s._comment), -- line and block comments
		sym("@comment.documentation")(s._comment), -- comments documenting code
		sym("@comment.error")(c.errorBlock), -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
		sym("@comment.warning")(c.warnBlock), -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
		sym("@comment.hint")(c.okBlock),
		sym("@comment.todo")(c.hintBlock), -- todo-type comments (e.g. `TODO`, `WIP`)
		sym("@comment.note")(c.infoBlock), -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

		-- Markup
		sym("@markup") { fg = p.mono16 }, -- text in markup language
		sym("@markup.strong") { fg = p.mono16, gui = "bold" }, -- bold
		sym("@markup.italic") { fg = p.mono16, gui = "italic" }, -- italic
		sym("@markup.strikethrough") { fg = p.mono12, gui = "strikethrough" }, -- strikethrough
		sym("@markup.underline") { fg = p.mono16, gui = "underline" }, -- underline (only for literal underline markup!)
		sym("@markup.heading") { fg = p.mono19 }, -- headings, titles (including markers)
		sym("@markup.heading.1")(s._md_h1), -- top-level heading
		sym("@markup.heading.2")(s._md_h2),
		sym("@markup.heading.3")(s._md_h3),
		sym("@markup.heading.4")(s._md_h4),
		sym("@markup.heading.5")(s._md_h5),
		sym("@markup.heading.6")(s._md_h6),
		sym("@markup.quote") { fg = p.mono12 }, -- quotes with >
		sym("@markup.math") { fg = p.mono15 }, -- math environments (e.g. `$ ... $` in LaTeX)
		sym("@markup.link") { fg = p.mono15 }, -- text references, footnotes, citations, etc
		sym("@markup.link.label") { fg = p.mono15, gui = "underline" }, -- link, reference, descriptions
		sym("@markup.link.url") { fg = p.mono15, gui = "underline" }, -- urls, links, emails
		sym("@markup.raw") { fg = p.accDim05 }, -- literal or verbatim text (e.g. inline code in markdown and for doc in python ("""))
		sym("@markup.raw.block") { fg = p.accDim05 }, -- literal or verbatim text as a stand-alone block
		sym("@markup.list") { fg = p.mono22 }, -- list markers
		sym("@markup.list.checked") { fg = p.mono22 }, -- checked todo-style list markers
		sym("@markup.list.unchecked") { fg = p.mono22 }, -- unchecked todo-style list markers
		sym("@markup.environment") { fg = p.mono12 }, -- text environments of markup languages
		sym("@markup.environment.name") { fg = p.mono12 }, -- text indicating the type of an environment

		-- Diff
		sym("@diff.plus") { fg = p.green00 }, -- added text (diff files)
		sym("@diff.minus") { fg = p.red00 }, -- removed text (diff files)
		sym("@diff.delta") { fg = p.yellow00 }, -- changed text (diff files)

		-- Tag
		sym("@tag")(s._tag), -- XML-style tag names (and similar)
		sym("@tag.builtin")(s._tag), -- builtin tag names (e.g. HTML5 tags)
		sym("@tag.attribute")(s._attribute), -- XML-style tag attributes
		sym("@tag.delimiter") { fg = p.mono11 }, -- XML-style tag delimiter (<>)
		sym("@tag.javascript") { fg = p.mono25, gui = "bold" }, -- component

		-- text in between tags
		sym("@markup.heading.1.tsx")(s._none),
		sym("@markup.heading.2.tsx")(s._none),
		sym("@markup.heading.3.tsx")(s._none),
		sym("@markup.heading.4.tsx")(s._none),
		sym("@markup.heading.5.tsx")(s._none),
		sym("@markup.heading.6.tsx")(s._none),
		sym("@markup.heading.1.jsx")(s._none),
		sym("@markup.heading.2.jsx")(s._none),
		sym("@markup.heading.3.jsx")(s._none),
		sym("@markup.heading.4.jsx")(s._none),
		sym("@markup.heading.5.jsx")(s._none),
		sym("@markup.heading.6.jsx")(s._none),
		sym("@markup.link.label.tsx")(s._none),
		sym("@markup.link.label.jsx")(s._none),

		-- Misc
		sym("@none")(s._none), -- completely disable the highlight
		sym("@error")(s._error),
		sym("@string.javascript")(s._none),

		-- CSS
		-- sym("@property.css")  {},
		-- sym("@property.scss")  {},
		-- sym("@property.id.css")  {},
		-- sym("@property.class.css")  {},
		-- sym("@type.css")  {},
		-- sym("@type.tag.css")  {},
		-- sym("@string.plain.css")  {},
		-- sym("@number.css")  {},
		-- sym("@keyword.directive.css")  {}, -- CSS at-rules: https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule.
		-- HTML
		-- sym("@string.special.url.html")  {}, -- Links in href, src attributes.
		-- sym("@markup.link.label.html")  {}, -- Text between <a></a> tags.
		-- sym("@character.special.html")  {}, -- Symbols such as &nbsp;.
		-- TOML, JSON, YAML
		-- sym("@property.toml")  {}, -- For fields.
		-- sym("@property.json")  {}, -- For fields.
		-- sym("@property.yaml")  {}, -- For fields.
		-- sym("@label.yaml")  {}, -- Anchor and alias names.
		-- Lua
		-- sym("@constructor.lua")  {}, -- For constructor calls and definitions: = { } in Lua.
		-- Python
		-- sym("@constructor.python")  {}, -- __init__(), __new__().
		-- Nix
		-- sym("@variable.member.nix")  {}, -- For fields.
		-- sym("@lsp.type.property.nix")  {}, -- Also for fields, from LSP.
		-- Ruby
		-- sym("@string.special.symbol.ruby")  {},
		-- PHP
		-- sym("@function.method.php")  {},
		-- sym("@function.method.call.php")  {},
		-- C/CPP
		-- sym("@keyword.import.c")  {},
		-- sym("@keyword.import.cpp")  {},
		-- C#
		-- sym("@attribute.c_sharp")  {},
		-- git
		-- sym("@comment.warning.gitcommit")  {},
		-- sym("@string.special.path.gitignore")  {},
	}
end)
