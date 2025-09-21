return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		keys = function()
			-- from https://www.lazyvim.org/plugins/treesitter#nvim-treesitter-textobjects
			local moves = {
				-- [ "iI", "@conditional.outer" ], [ "lL", "@loop.outer" ]
				goto_next_start = {
					["]o"] = "@block.outer",
					["]f"] = "@function.outer",
					["]c"] = "@class.outer",
					["]a"] = "@parameter.outer",
					["]u"] = "@call.outer",
					["]x"] = "@assignment.outer",
					["]r"] = "@property.outer",
					["]j"] = "@attribute.outer",
				},
				goto_next_end = {
					["]O"] = "@block.outer",
					["]F"] = "@function.outer",
					["]C"] = "@class.outer",
					["]A"] = "@parameter.outer",
					["]U"] = "@call.outer",
					["]X"] = "@assignment.outer",
					["]R"] = "@property.outer",
					["]J"] = "@attribute.outer",
				},
				goto_previous_start = {
					["[o"] = "@block.outer",
					["[f"] = "@function.outer",
					["[c"] = "@class.outer",
					["[a"] = "@parameter.outer",
					["[u"] = "@call.outer",
					["[x"] = "@assignment.outer",
					["[r"] = "@property.outer",
					["[j"] = "@attribute.outer",
				},
				goto_previous_end = {
					["[O"] = "@block.outer",
					["[F"] = "@function.outer",
					["[C"] = "@class.outer",
					["[A"] = "@parameter.outer",
					["[U"] = "@call.outer",
					["[X"] = "@assignment.outer",
					["[R"] = "@property.outer",
					["[J"] = "@attribute.outer",
				},
			}
			local ret = {} ---@type LazyKeysSpec[]
			for method, keymaps in pairs(moves) do
				for key, query in pairs(keymaps) do
					local desc = query:gsub("@", ""):gsub("%..*", "")
					desc = desc:sub(1, 1):upper() .. desc:sub(2)
					desc = (key:sub(1, 1) == "[" and "Prev " or "Next ") .. desc
					desc = desc .. (key:sub(2, 2) == key:sub(2, 2):upper() and " End" or " Start")
					ret[#ret + 1] = {
						key,
						function()
							-- don't use treesitter if in diff mode and the key is one of the c/C keys
							if vim.wo.diff and key:find("[cC]") then
								return vim.cmd("normal! " .. key)
							end
							require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
						end,
						desc = desc,
						mode = { "n", "x", "o" },
						silent = true,
					}
				end
			end
			return ret
		end,
	},
	{
		"nvim-mini/mini.ai",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
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

					a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }), -- parameter
					x = ai.gen_spec.treesitter({ a = "@assignment.outer", i = "@assignment.inner" }), -- assignment
					r = ai.gen_spec.treesitter({ a = "@property.outer", i = "@property.inner" }), -- property
					j = ai.gen_spec.treesitter({ a = "@attribute.outer", i = "@attribute.inner" }), -- html/jsx attribute
				},
			}
		end,
	},
}
