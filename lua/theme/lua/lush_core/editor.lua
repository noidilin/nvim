-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hsl

-- design system: component token
return lush(function()
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight groups. See :h highlight-groups
		ColorColumn { bg = p.mono05 }, -- Columns set with 'colorcolumn'
		Conceal { fg = p.mono22, bg = p.mono02 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor { gui = "reverse" }, -- Character under the cursor
		vCursor { gui = "reverse" },
		iCursor { gui = "reverse" },
		lCursor { gui = "reverse" }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM { gui = "reverse" }, -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn { bg = p.mono03 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine { bg = p.mono03 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory { fg = p.acc02 }, -- Directory names (and other special names in listings)
		EndOfBuffer { fg = p.mono12 }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		ErrorMsg { fg = p.red00, gui = "bold" }, -- Error messages on the command line
		VertSplit { fg = p.mono07 }, -- Column separating vertically split windows
		Folded { fg = p.mono12, bg = p.mono02 }, -- Line used for closed folds
		FoldColumn { fg = p.mono12, bg = p.mono02 }, -- 'foldcolumn'
		SignColumn { fg = p.mono16, bg = p.mono02 }, -- Column where |signs| are displayed
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
		Question { fg = p.accDim05 }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine { fg = p.mono22, gui = "underline" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search { fg = p.mono16, bg = p.mono10 or p.mono07 }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		IncSearch { fg = p.mono02, bg = p.mono10 or p.mono07 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch { fg = p.mono16, bg = p.mono07 or p.mono05 }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
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
		Terminal { fg = p.mono16, bg = p.mono02 },
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		ToolbarButton { fg = p.mono02, bg = p.mono07 },
		ToolbarLine { fg = p.mono16 },
		Title { fg = p.mono10 }, -- Titles for output from ":set all", ":autocmd"
		Visual { fg = p.mono16, bg = p.mono07 }, -- Visual mode selection
		VisualNOS { bg = p.mono12, gui = "underline" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg { fg = p.orange00, gui = "bold" }, -- Warning messages
		Whitespace { fg = p.mono07 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WinSeparator { fg = p.mono07 }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu { fg = p.mono02, bg = p.mono22 }, -- Current match in 'wildmenu' completion
		WinBar { fg = p.mono04 }, -- Window bar of current window
		WinBarNC { fg = p.mono04 }, -- Window bar of not-current windows
	}
end)
