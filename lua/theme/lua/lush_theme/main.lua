local lush = require("lush")

-- core
local editor = require("lush_core.editor")
local syntax = require("lush_core.syntax")
local treesitter = require("lush_core.treesitter")
local lsp = require("lush_core.lsp")
-- plugin
local bufferline = require("lush_plugin.bufferline")
local markdown = require("lush_plugin.markdown")
local neotest = require("lush_plugin.neotest")
local snack = require("lush_plugin.snack")
local avante = require("lush_plugin.avante")
local trivia = require("lush_plugin.trivia")
-- stale
-- local neotree = require("lush_stale.neotree")
-- local telescope = require("lush_stale.telescope")
-- local fzflua = require("lush_stale.fzflua")
-- local dashboard = require("lush_stale.dashboard")
-- local cmp = require("lush_stale.cmp")

local specs = {
	editor,
	syntax,
	treesitter,
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
