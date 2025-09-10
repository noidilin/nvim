-- stylua: ignore
if true then return {} end

-- NOTE:
-- img-clip.nvim provide image pasting feature, but it currently won't work on nushell + windows device
-- snack.image provide image preview feature, but it heavily relys on caching image in png format.

-- Try to resolve the real path of the vault
local VAULT_PATH = vim.uv.fs_realpath(vim.fn.expand("$XDG_DATA_HOME/obsidian"))

-- Fallback to a default value if VAULT_PATH is nil
if not VAULT_PATH then
	vim.notify("Vault path not found. Using fallback path.", vim.log.levels.WARN)
	VAULT_PATH = "" -- Set a reasonable default here
else
	-- Normalize slashes to forward slashes
	VAULT_PATH = VAULT_PATH:gsub("\\", "/")
end

local MD_PATH = VAULT_PATH .. "/**.md"

return {
	"obsidian-nvim/obsidian.nvim",
	lazy = true,
	event = {
		"BufReadPre " .. MD_PATH,
		"BufNewFile " .. MD_PATH,
	},

	opts = {
		workspaces = { { name = "obsidian", path = VAULT_PATH } },
		notes_subdir = "source", -- keep notes in a specific subdirectory of your vault.
		new_notes_location = "notes_subdir", -- put new notes in the default notes subdirectory.
		daily_notes = { folder = "calendar/daily", template = "daily.md" },
		templates = {
			folder = "extra/templates",
			substitutions = {
				year = function() -- "2024"
					return os.date("%Y", os.time())
				end,
				month = function() -- "2024-09"
					return os.date("%Y-%m", os.time())
				end,
				week = function() -- "2024-03-w10"
					return os.date("%Y-%m-w%V", os.time())
				end,
				-- nextweek = function() -- "2024-03-w11"
				-- 	local adjustment = 7 * 24 * 60 * 60 -- One week in seconds
				-- 	return os.date("%Y-%m-w%V", os.time() + adjustment)
				-- end,
			},
		},

		completion = {
			nvim_cmp = false,
			blink = false,
			min_chars = 99, -- Trigger completion at 2 chars.
			create_new = false, -- Set to false to disable new note creation in the picker
		},
		disable_frontmatter = true, -- boolean or a function that takes a filename and returns a boolean.
		ui = { enable = false },
		picker = { name = "snacks.pick" },

		-- key mappings
		callbacks = {
			enter_note = function(_, note)
				vim.keymap.del("n", "<CR>", { buffer = note.bufnr })
				vim.keymap.set("n", "]n", function()
					require("obsidian.api").nav_link("next")
				end, { buffer = note.bufnr, desc = "Obsidian next link" })
				vim.keymap.set("n", "[n", function()
					require("obsidian.api").nav_link("prev")
				end, { buffer = note.bufnr, desc = "Obsidian previous link" })
			end,
		},
	},

	dependencies = {
		{
			"folke/which-key.nvim",
			opts = {
				spec = {
					-- note that `<cmd>ObsidianExtractNote<cr>` and `:ObsidianExtractNote<cr>` are not equal.
					{ "<leader>n", group = "+obsidian", mode = { "n", "v" }, icon = { icon = "" } },
					{ "<leader>ny", "<cmd>Obsidian yesterday<cr>", desc = "yesterday", icon = { icon = "" } },
					{ "<leader>nd", "<cmd>Obsidian today<cr>", desc = "today", icon = { icon = "" } },
					{ "<leader>nt", "<cmd>Obsidian tomorrow<cr>", desc = "tomorrow", icon = { icon = "" } },
					{ "<leader>ns", "<cmd>Obsidian template<cr>", desc = "snippet", icon = { icon = "" } },
				},
			},
		},
	},
}
