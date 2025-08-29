-- stylua: ignore
-- if true then return {} end

return {
	{
		"neovim/nvim-lspconfig",
		-- biome default config:  https://github.com/neovim/nvim-lspconfig/blob/master/lsp/biome.lua
		opts = { servers = { biome = {} } },
	},
}
