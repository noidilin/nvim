-- stylua: ignore
if true then return {} end

local leet_arg = "leetcode.nvim"

return {
	"kawre/leetcode.nvim",
	lazy = leet_arg ~= vim.fn.argv()[1],
	-- cmd = "Leet",
	build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",

		-- optional
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		arg = leet_arg,
		lang = "javascript",
	},
}
