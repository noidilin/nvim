-- LSP/Linters mistakenly show `undefined global` errors in the spec
---@diagnostic disable: undefined-global

local lush = require("lush")
local p = require("lush_theme._primitive").hex
local s = require("lush_theme._semantic")

return lush(function()
	return {
		-- markdown render
		--- icons
		RenderMarkdownH1(s._md_h1),
		RenderMarkdownH2(s._md_h2),
		RenderMarkdownH3(s._md_h3),
		RenderMarkdownH4(s._md_h4),
		RenderMarkdownH5(s._md_h5),
		RenderMarkdownH6(s._md_h6),
		--- background line
		RenderMarkdownH1Bg(s._md_h1),
		RenderMarkdownH2Bg(s._md_h2),
		RenderMarkdownH3Bg(s._md_h3),
		RenderMarkdownH4Bg(s._md_h4),
		RenderMarkdownH5Bg(s._md_h5),
		RenderMarkdownH6Bg(s._md_h6),
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
		RenderMarkdownLink { fg = p.accDim02 }, -- image & hyperlink icons
		--- table
		-- RenderMarkdownTableHead {  },
		-- RenderMarkdownTableRow {  },
		-- RenderMarkdownTableFill {  },
		--- checkbox
		-- RenderMarkdownChecked {  },
		-- RenderMarkdownUnchecked {  },
		-- RenderMarkdownTodo {  },

		-- obsidian
		ObsidianTodo { fg = p.acc06, gui = "bold" },
		ObsidianDone { fg = p.mono15, gui = "bold" },
		ObsidianRightArrow { fg = p.acc06, gui = "bold" },
		ObsidianTilde { fg = p.red01, gui = "bold" },
		ObsidianImportant { fg = p.red00, gui = "bold" },
		ObsidianBullet { fg = p.mono15, gui = "bold" },
		ObsidianRefText { fg = p.mono19, gui = "underline" },
		ObsidianExtLinkIcon { fg = p.acc05 },
		ObsidianTag { fg = p.mono07, bg = p.mono00, gui = "italic" },
		ObsidianBlockID { fg = p.mono07, gui = "italic" },
		ObsidianHighlightText { bg = p.mono09 },
	}
end)
