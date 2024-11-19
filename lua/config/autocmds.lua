-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local hls = {
	-- plugin
	-- markdown render - callout
	RenderMarkdownInfo = { fg = "#707070" },
	RenderMarkdownSuccess = { fg = "#778777" },
	RenderMarkdownHint = { fg = "#769494" },
	RenderMarkdownWarn = { fg = "#c8a492" },
	RenderMarkdownError = { fg = "#b07878" },
	RenderMarkdownQuote = { fg = "#8e8b85" },
}

vim.api.nvim_create_autocmd("BufReadPre", {
	group = vim.api.nvim_create_augroup("noidilin_highlights", { clear = true }),
	desc = "Change plugin highlights",
	callback = function()
		for hl_group, hl in pairs(hls) do
			hl.default = true
			vim.api.nvim_set_hl(0, hl_group, hl)
		end
	end,
})
