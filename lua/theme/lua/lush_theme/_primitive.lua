local lush = require("lush")

local M = {}

M.hex = {
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

	red01     = "#cc9393", -- '#eba0ac' maroon
	red00     = "#b07878", -- '#f38ba8' red
	green01   = "#9bb09b", -- '#94e2d5' teal
	green00   = "#778777", -- '#a6e3a1' green
	yellow01  = "#ebd6b7", -- '#f9e2af' yellow
	yellow00  = "#d6caab", -- '#fab387' peach
	blue01    = "#9db2cf", -- '#b4befe' lavender
	blue00    = "#7d96ad", -- '#89b4fa' blue
	magenta01 = "#9f9fbd", -- '#f5c2e7' pink
	magenta00 = "#797994", -- '#cba6f7' mauve
	cyan01    = "#92b3b3", -- '#89dceb' sky
	cyan00    = "#769494", -- '#74c7ec' sapphire
	orange01  = "#dcb5a5", -- '#f5e0dc' rosewater
	orange00  = "#c8a492", -- '#f2cdcd' flamingo
}

local function map_palette(palette, transform)
	local result = {}
	for k, v in pairs(palette) do
		result[k] = transform(v)
	end
	return result
end

M.hsl = map_palette(M.hex, lush.hsl)

return M
