-- stylua: ignore
if true then return {} end

return {
	"tris203/precognition.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>uM",
			function()
				require("precognition").toggle()
			end,
			desc = "toggle motion hint",
		},
	},
	opts = { startVisible = false },
}
