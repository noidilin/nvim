return { -- Navigate code with Treesitter
  "nvim-treesitter/nvim-treesitter-textobjects",
  -- vscode won't load up nvim-treesitter-textobjects with lazy set to true
  -- lazy = true,

  config = function()
    -- note that it is requiring "nvim-treesitter.configs"
    require("nvim-treesitter.configs").setup({
      textobjects = {
        --[[ select = {
          enable = true,
          lookahead = true,   -- automatically jump forward to textobj, similar to targets.vim
          keymaps = {         -- you can use the capture groups defined in textobjects.scm
            ["as"] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
            ["is"] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
            ["ls"] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
            ["rs"] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
            -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
            ["ar"] = { query = "@property.outer", desc = "Select outer part of an object property" },
            ["ir"] = { query = "@property.inner", desc = "Select inner part of an object property" },
            ["lr"] = { query = "@property.lhs", desc = "Select left part of an object property" },
            ["rr"] = { query = "@property.rhs", desc = "Select right part of an object property" },
          },
        }, ]]
        swap = { -- swap with next or previous textobjects
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
        },
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
    })
  end,
}
