return {
	"echasnovski/mini.ai",
	opts = function()
		local ai = require("mini.ai")
		return {
			n_lines = 500,
			custom_textobjects = {
				-- treesitter-text-object
				o = ai.gen_spec.treesitter({ -- code block
					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
				}),
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function method
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
				a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }), -- parameter
				i = ai.gen_spec.treesitter({ a = "@call.outer", i = "@call.inner" }), -- function call
				s = ai.gen_spec.treesitter({ a = "@assignment.outer", i = "@assignment.inner" }), -- assignment
				r = ai.gen_spec.treesitter({ a = "@property.outer", i = "@property.inner" }), -- property

				-- regex
				t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
				d = { "%f[%d]%d+" }, -- digits
				e = { -- Word with case
					{ "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
					"^().*()$",
				},

				-- i = LazyVim.mini.ai_indent, -- indent
				-- g = LazyVim.mini.ai_buffer, -- buffer
				u = ai.gen_spec.function_call(), -- u for "Usage"
				U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
			},
		}
	end,
}
