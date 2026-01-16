return {
	{ "nvzone/showkeys", cmd = "ShowkeysToggle", opts = { maxkeys = 5 } },
	-- { "nvzone/minty", cmd = { "Shades", "Huefy" }, dependencies = { "nvzone/volt" } },
	{
		"atiladefreitas/dooing",
		config = {
			notes = { icon = "" },
			due_notifications = { on_startup = true },
			keymaps = { create_nested_task = "n" },
		},
	},
}
