return {
	"levouh/tint.nvim",
	event = "VeryLazy",
	opts = function()
		local tint = require("tint")
		tint.setup({
			-- ref: https://github.com/levouh/tint.nvim/blob/master/DOC.md#transforms-tint_with_threshold
			transforms = {
				-- WARN: bad practice to hardcode a color value like #191919
				require("tint.transforms").tint_with_threshold(-35, "#191919", 20), -- tint by -40, keep 20 away from #191919
				require("tint.transforms").saturate(0.4),
			},
		})
		return {
			-- tint and saturation is already set with transforms in setup().
			tint_background_colors = false, -- Tint background portions of highlight groups
		}
	end,
}
