return {
	"nvim-mini/mini.operators",
	event = "VeryLazy",
	version = false,
	-- No need to copy this inside `setup()`. Will be used automatically.
	opts = {
		-- Evaluate text and replace with output
		evaluate = { prefix = "ge=", func = nil },
		-- Exchange text regions
		exchange = { prefix = "gex", reindent_linewise = true },
		-- Multiply (duplicate) text
		multiply = { prefix = "gem", func = nil },
		-- Replace text with register
		replace = { prefix = "ger", reindent_linewise = true },
		-- Sort text
		sort = { prefix = "ges", func = nil },
	},
}
