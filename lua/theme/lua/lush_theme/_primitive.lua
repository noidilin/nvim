local lush = require("lush")

-- achroma primitive palette, dark + light.
--
-- The numeric index is a ROLE, not a lightness: low = "background side",
-- high = "foreground side". The light table keeps every key name and reverses
-- which end is bright, so _semantic, _component, every lush_core/* and
-- lush_plugin/* spec, and lua/plugins/ui.lua's lualine table all follow the
-- variant with no further edits.
--
-- `M.hex` is bound to `vim.o.background` at load time. colors/achroma*.lua
-- clear this module from package.loaded before requiring, so the binding is
-- re-evaluated on every :colorscheme / :set background.

local M = {}

M.dark = {
	mono25 = "#eaeaea",
	mono24 = "#dcdcdc",
	mono23 = "#cccccc",
	mono22 = "#c0c0c0",
	mono21 = "#b3b3b3", -- text
	mono20 = "#aaaaaa",
	mono19 = "#9d9d9d", -- subtext1
	mono18 = "#8e8e8e",
	mono17 = "#878787", -- subtext0
	mono16 = "#7f7f7f",
	mono15 = "#707070", -- overlay2
	mono14 = "#686868",
	mono13 = "#5d5d5d", -- overlay1
	mono12 = "#555555",
	mono11 = "#4e4e4e", -- overlay0
	mono10 = "#474747",
	mono09 = "#414141", -- surface2
	mono08 = "#3a3a3a",
	mono07 = "#353535", -- surface1
	mono06 = "#303030",
	mono05 = "#2a2a2a", -- surface0
	mono04 = "#242424",
	mono03 = "#1e1e1e", -- base
	mono02 = "#191919", -- mantle
	mono01 = "#151515", -- crust
	mono00 = "#101010",

	acc08 = "#faf5eb",
	acc07 = "#dad5c8",
	acc06 = "#c0baad",
	acc05 = "#b3ad9f",
	acc04 = "#a69f91",
	acc03 = "#9a9487",
	acc02 = "#8e897d",
	acc01 = "#7f7b70",
	acc00 = "#706c62",
	accDim08 = "#f7f4ed",
	accDim07 = "#d6d3cc",
	accDim06 = "#bdbab2",
	accDim05 = "#b4b0a7",
	accDim04 = "#a19d97",
	accDim03 = "#97948c",
	accDim02 = "#8e8b85",
	accDim01 = "#7b7974",
	accDim00 = "#6c6a65",

	red01 = "#cc9393", -- '#eba0ac' maroon
	red00 = "#b07878", -- '#f38ba8' red
	green01 = "#9bb09b", -- '#94e2d5' teal
	green00 = "#778777", -- '#a6e3a1' green
	yellow01 = "#ebd6b7", -- '#f9e2af' yellow
	yellow00 = "#d6caab", -- '#fab387' peach
	blue01 = "#9db2cf", -- '#b4befe' lavender
	blue00 = "#7d96ad", -- '#89b4fa' blue
	magenta01 = "#9f9fbd", -- '#f5c2e7' pink
	magenta00 = "#797994", -- '#cba6f7' mauve
	cyan01 = "#92b3b3", -- '#89dceb' sky
	cyan00 = "#769494", -- '#74c7ec' sapphire
	orange01 = "#dcb5a5", -- '#f5e0dc' rosewater
	orange00 = "#c8a492", -- '#f2cdcd' flamingo
}

-- Greys marked (zebar) are verbatim from ~/.glzr/zebar/noidilin/styles.css so
-- the bar, the terminal and the editor share one set of surfaces.
M.light = {
	mono00 = "#ffffff",
	mono01 = "#fafafa",
	mono02 = "#f7f7f7", -- mantle   (zebar)
	mono03 = "#ededed", -- base     (zebar)
	mono04 = "#ebebeb",
	mono05 = "#eaeaea", -- surface0 (zebar)
	mono06 = "#e5e5e5",
	mono07 = "#e0e0e0", -- surface1 (zebar)
	mono08 = "#dadada",
	mono09 = "#d4d4d4", -- surface2 (zebar)
	mono10 = "#c4c4c4",
	mono11 = "#b4b4b4", -- overlay0
	mono12 = "#9f9f9f",
	mono13 = "#8a8a8a", -- overlay1 (zebar)
	mono14 = "#7c7c7c",
	mono15 = "#6e6e6e", -- overlay2 (zebar)
	mono16 = "#656565",
	mono17 = "#5c5c5c", -- subtext0 (zebar)
	mono18 = "#555555",
	mono19 = "#4d4d4d", -- subtext1 (zebar)
	mono20 = "#444444",
	mono21 = "#3a3a3a", -- text     (zebar)
	mono22 = "#313131",
	mono23 = "#292929",
	mono24 = "#1f1f1f",
	mono25 = "#111111",

	-- warm accent, lightness mirrored, hue/sat preserved
	acc08 = "#24211a",
	acc07 = "#35312a",
	acc06 = "#454037",
	acc05 = "#524c42",
	acc04 = "#5f594e",
	acc03 = "#6c655a",
	acc02 = "#7a7367",
	acc01 = "#8b8478",
	acc00 = "#9c9488",
	accDim08 = "#201e1a",
	accDim07 = "#302e29",
	accDim06 = "#403d37",
	accDim05 = "#4c4a44",
	accDim04 = "#5a5750",
	accDim03 = "#67645d",
	accDim02 = "#75726b",
	accDim01 = "#86837c",
	accDim00 = "#97948c",

	-- Re-derived, not inverted: the dark pastels land at 2.1-2.8:1 on #ededed.
	-- XX01 remains the emphasis slot, i.e. darker than XX00 in light mode.
	red01 = "#7f4747", -- maroon
	red00 = "#9b5f5f", -- red
	green01 = "#3d573d", -- teal
	green00 = "#4f6b4f", -- green
	yellow01 = "#5c4c2c", -- yellow
	yellow00 = "#6f5c37", -- peach
	blue01 = "#384f68", -- lavender
	blue00 = "#4a6480", -- blue
	magenta01 = "#4a4a66", -- pink
	magenta00 = "#5f5f7e", -- mauve
	cyan01 = "#3b5a5a", -- sky
	cyan00 = "#4f7070", -- sapphire
	orange01 = "#70503c", -- rosewater
	orange00 = "#8a6348", -- flamingo
}

M.is_light = vim.o.background == "light"
M.hex = M.is_light and M.light or M.dark

local function map_palette(palette, transform)
	local result = {}
	for k, v in pairs(palette) do
		result[k] = transform(v)
	end
	return result
end

M.hsl = map_palette(M.hex, lush.hsl)

return M
