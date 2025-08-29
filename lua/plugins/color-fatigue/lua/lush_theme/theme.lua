local lush = require("lush")

-- basic
local core = require("lush_theme._core")
local syntax = require("lush_theme._syntax")
local trsssitter = require("lush_theme._treesitter")
local lsp = require("lush_theme._lsp")
-- plugin
local bufferline = require("lush_theme.bufferline")
local markdown = require("lush_theme.markdown")
local neotest = require("lush_theme.neotest")
local snack = require("lush_theme.snack")
local avante = require("lush_theme.avante")
local trivia = require("lush_theme.trivia")
-- depreciated
-- local neotree = require("lush_theme.neotree")
-- local telescope = require("lush_theme.telescope")
-- local fzflua = require("lush_theme.fzflua")
-- local dashboard = require("lush_theme.dashboard")
-- local cmp = require("lush_theme.cmp")

local specs = {
	core,
	syntax,
	trsssitter,
	lsp,
	bufferline,
	markdown,
	neotest,
	snack,
	avante,
	trivia,
	-- neotree,
	-- telescope,
	-- fzflua,
	-- dashboard,
	-- cmp,
}

return lush.merge(specs)

-- neotree_highlights,
-- telescope_highlights,
-- fzflua_highlights,
-- dashboard_highlights,
-- cmp_highlights
