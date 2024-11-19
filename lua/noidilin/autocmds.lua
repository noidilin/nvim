-- [[ Auto Command ]]
-- highlight when yanking (copying) text ( `:help vim.highlight.on_yank()` )
--[[ vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	-- create auto group for the auto command
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		-- create highlight group
		vim.api.nvim_set_hl(0, "yankHighlight", { fg = "#cccccc", bg = "#474747" })
		-- highlight yank text with the highlight group
		vim.highlight.on_yank({ higroup = "yankHighlight", timeout = 1000 })
	end,
}) ]]

-- [[ Set up highlight group ]]
local hls = {
	-- flash.nvim
	FlashBackdrop = { fg = '#414141' },
	FlashCurrent = { bg = '#878787', fg = '#151515', bold = true },
	FlashLabel = { fg = '#dad5c8', bold = true },
	FlashMatch = { bg = '#2a2a2a', fg = '#8e8b85', underline = true },
	FlashCursor = { reverse = true },
	YankyYanked = { fg = "#dad5c8", bg = "#474747" },
	YankyPut = { fg = "#dad5c8", bg = "#474747" },
}
for hl_group, hl in pairs(hls) do
	hl.default = true
	vim.api.nvim_set_hl(0, hl_group, hl)
end
