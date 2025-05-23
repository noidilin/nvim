local lush = require("lush")
local hsl = lush.hsl

local M = {}

local function map_palette(palette, transform)
	local result = {}
	for k, v in pairs(palette) do
		result[k] = transform(v)
	end
	return result
end

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
	acc_dim08 = "#f7f4ed",
	acc_dim07 = "#d6d3cc",
	acc_dim06 = "#bdbab2",
	acc_dim05 = "#b4b0a7",
	acc_dim04 = "#a19d97",
	acc_dim03 = "#97948c",
	acc_dim02 = "#8e8b85",
	acc_dim01 = "#7b7974",
	acc_dim00 = "#6c6a65",

	red01 = "#cc9393",
	red00 = "#b07878",
	green01 = "#9bb09b",
	green00 = "#778777",
	yellow01 = "#ebd6b7",
	yellow00 = "#d6caab",
	blue01 = "#9db2cf",
	blue00 = "#7d96ad",
	magenta01 = "#9f9fbd",
	magenta00 = "#797994",
	cyan01 = "#92b3b3",
	cyan00 = "#769494",
	orange01 = "#dcb5a5",
	orange00 = "#c8a492",
}

M.hsl = map_palette(M.hex, hsl)

return M
