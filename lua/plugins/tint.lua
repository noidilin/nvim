return {
	"levouh/tint.nvim",
	opts = {
		-- set tint and saturation with transforms in config field.
		-- tint = -30, -- Darken colors, use a positive value to brighten
		-- saturation = 0.1, -- Saturation to preserve
		tint_background_colors = false, -- Tint background portions of highlight groups
		-- highlight_ignore_patterns = { "WinSeparator", "Status.*" },  -- Highlight group patterns to ignore, see `string.find`
	},
	config = function()
		require("tint").setup({
			-- ref: https://github.com/levouh/tint.nvim/blob/master/DOC.md#transforms-tint_with_threshold
			transforms = {
				-- WARN: bad practice to hardcode a color value like #191919
				require("tint.transforms").tint_with_threshold(-35, "#191919", 20), -- tint by -40, keep 20 away from #191919
				require("tint.transforms").saturate(0.4),
			},
		})
	end,
}
