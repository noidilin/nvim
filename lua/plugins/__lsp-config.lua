-- stylua: ignore
if true then return {} end

return {
	{
		"neovim/nvim-lspconfig",
		opts = { servers = { biome = {} } },
	},
}
