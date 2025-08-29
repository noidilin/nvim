return {
	"nvim-mini/mini.operators",
	version = false,
	-- No need to copy this inside `setup()`. Will be used automatically.
	opts = {
		-- Evaluate text and replace with output
		evaluate = {
			prefix = "ge=",
			func = nil, -- Function which does the evaluation
		},

		-- Exchange text regions
		exchange = {
			-- NOTE: Default `gx` is remapped to `gX`
			prefix = "gex",
			reindent_linewise = true, -- Whether to reindent new text to match previous indent
		},

		-- Multiply (duplicate) text
		multiply = {
			prefix = "gem",
			func = nil, -- Function which can modify text before multiplying
		},

		-- Replace text with register
		replace = {
			-- NOTE: Default `gr*` LSP mappings are removed
			prefix = "ger",
			reindent_linewise = true, -- Whether to reindent new text to match previous indent
		},

		-- Sort text
		sort = {
			prefix = "ges",
			func = nil, -- Function which does the sort
		},
	},
}
