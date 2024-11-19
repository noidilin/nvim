return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-\\>",
				node_incremental = "<C-\\>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		textobjects = {
			--[[ swap = { -- swap with next or previous textobjects
					enable = true,
					swap_next = {
						["<leader>]a"] = "@parameter.inner",
						["<leader>]r"] = "@property.outer",
						["<leader>]f"] = "@function.outer",
					},
					swap_previous = {
						["<leader>[a"] = "@parameter.inner",
						["<leader>[r"] = "@property.outer",
						["<leader>[f"] = "@function.outer",
					},
				}, ]]
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				-- [ "iI", "@conditional.outer" ], [ "lL", "@loop.outer" ]
				goto_next_start = {
					["]o"] = "@block.outer",
					["]f"] = "@function.outer",
					["]c"] = "@class.outer",
					["]a"] = "@parameter.outer",
					["]i"] = "@call.outer",
					["]s"] = "@assignment.outer",
					["]r"] = "@property.outer",
				},
				goto_next_end = {
					["]O"] = "@block.outer",
					["]F"] = "@function.outer",
					["]C"] = "@class.outer",
					["]A"] = "@parameter.outer",
					["]I"] = "@call.outer",
					["]S"] = "@assignment.outer",
					["]R"] = "@property.outer",
				},
				goto_previous_start = {
					["[o"] = "@block.outer",
					["[f"] = "@function.outer",
					["[c"] = "@class.outer",
					["[a"] = "@parameter.outer",
					["[i"] = "@call.outer",
					["[s"] = "@assignment.outer",
					["[r"] = "@property.outer",
				},
				goto_previous_end = {
					["[O"] = "@block.outer",
					["[F"] = "@function.outer",
					["[C"] = "@class.outer",
					["[A"] = "@parameter.outer",
					["[I"] = "@call.outer",
					["[S"] = "@assignment.outer",
					["[R"] = "@property.outer",
				},
			},
		},
	},
}
