return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<S-space>",
					node_incremental = "<S-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					-- [ "iI", "@conditional.outer" ], [ "lL", "@loop.outer" ]
					goto_next_start = {
						["]o"] = "@block.outer",
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]a"] = "@parameter.outer",
						["]u"] = "@call.outer",
						["]x"] = "@assignment.outer",
						["]r"] = "@property.outer",
					},
					goto_next_end = {
						["]O"] = "@block.outer",
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
						["]A"] = "@parameter.outer",
						["]U"] = "@call.outer",
						["]X"] = "@assignment.outer",
						["]R"] = "@property.outer",
					},
					goto_previous_start = {
						["[o"] = "@block.outer",
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[a"] = "@parameter.outer",
						["[u"] = "@call.outer",
						["[x"] = "@assignment.outer",
						["[r"] = "@property.outer",
					},
					goto_previous_end = {
						["[O"] = "@block.outer",
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
						["[A"] = "@parameter.outer",
						["[U"] = "@call.outer",
						["[X"] = "@assignment.outer",
						["[R"] = "@property.outer",
					},
				},
			},
		},
	},
	{
		"echasnovski/mini.ai",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function method
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }), -- parameter
					x = ai.gen_spec.treesitter({ a = "@assignment.outer", i = "@assignment.inner" }), -- assignment
					r = ai.gen_spec.treesitter({ a = "@property.outer", i = "@property.inner" }), -- property

					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},

					g = LazyVim.mini.ai_buffer, -- buffer
					u = ai.gen_spec.function_call(), -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
			}
		end,
	},
}
