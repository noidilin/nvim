-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

if vim.g.vscode then
	local hls = {
		FlashBackdrop = { fg = "#414141" },
		FlashCurrent = { bg = "#878787", fg = "#151515", bold = true },
		FlashLabel = { fg = "#dad5c8", bold = true },
		FlashMatch = { bg = "#2a2a2a", fg = "#8e8b85", underline = true },
		FlashCursor = { reverse = true },
		YankyYanked = { fg = "#dad5c8", bg = "#474747" },
		YankyPut = { fg = "#dad5c8", bg = "#474747" },
	}

	for hl_group, hl in pairs(hls) do
		hl.default = true
		vim.api.nvim_set_hl(0, hl_group, hl)
	end
end
