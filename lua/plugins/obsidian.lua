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
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	event = {
		"BufReadPre " .. MD_PATH,
		"BufNewFile " .. MD_PATH,
	},

	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"folke/which-key.nvim",
			opts = {
				spec = {
					-- note that `<cmd>ObsidianExtractNote<cr>` and `:ObsidianExtractNote<cr>` are not equal.
					{ "<leader>n", group = "+obsidian", mode = { "n", "v" }, icon = { icon = "" } },
					{ "<leader>na", ":ObsidianNew<cr>", desc = "new file", icon = { icon = "" } },
					{ "<leader>n]", ":ObsidianLinks<cr>", desc = "links", icon = { icon = "" } },
					{ "<leader>n[", ":ObsidianBacklinks<cr>", desc = "backlinks", icon = { icon = "󰌷" } },
					{ "<leader>nd", ":ObsidianToday<cr>", desc = "daily", icon = { icon = "" } },
					{ "<leader>nt", ":ObsidianTemplate<cr>", desc = "snippet", icon = { icon = "" } },
					{ "<leader>nT", ":ObsidianNewFromTemplate<cr>", desc = "template", icon = { icon = "" } },
					{ "<leader>no", ":ObsidianOpen<cr>", desc = "open in obsidian", icon = { icon = "" } },
					{ "<leader>nr", ":ObsidianRename<cr>", desc = "rename", icon = { icon = "" } },
					{ "<leader>nx", ":ObsidianExtractNote<cr>", mode = "v", desc = "extract", icon = { icon = "" } },
					-- { "<leader>np", ":ObsidianPasteImg<cr>", desc = "paste img", icon = { icon = "" }, },
				},
			},
		},
	},

	opts = {
		workspaces = { { name = "obsidian", path = VAULT_PATH } },
		notes_subdir = "source", -- keep notes in a specific subdirectory of your vault.
		new_notes_location = "notes_subdir", -- put new notes in the default notes subdirectory.
		daily_notes = {
			folder = "calendar/daily",
			date_format = "%Y-%m-%d",
			template = "daily.md", -- automatically insert template from template directory like 'daily.md'
		},
		templates = {
			folder = "extra/templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			-- ref: https://github.com/epwalsh/obsidian.nvim/discussions/475
			-- substitute {{template_variable}} when inserting a template.
			substitutions = {
				-- "14:45:00"
				time24 = function()
					return os.date("%H:%M:%S")
				end,
				-- "2:45:00 PM"
				time12 = function()
					local hour = tonumber(os.date("%H"))
					local ampm = hour >= 12 and "PM" or "AM"
					hour = hour % 12
					hour = hour == 0 and 12 or hour
					return string.format("%02d:%s %s", hour, os.date("%M:%S"), ampm)
				end,
				-- "2024"
				year = function()
					return os.date("%Y", os.time())
				end,
				-- "March"
				month = function()
					return os.date("%B", os.time())
				end,
				-- "2024-03-05"
				yesterday = function()
					return os.date("%Y-%m-%d", os.time() - 86400)
				end,
				-- "2024-03-07"
				nextday = function()
					return os.date("%Y-%m-%d", os.time() + 86400)
				end,
				-- "Wednesday, March 6, 2024"
				hdate = function()
					return os.date("%A, %B %d, %Y")
				end,
				-- "2024-03-06T14:45:00+00:00"
				rfc3339 = function()
					return os.date("!%Y-%m-%dT%H:%M:%SZ")
				end,
				-- "10"
				week = function()
					return os.date("%V", os.time())
				end,
				-- "2024-W10"
				isoweek = function()
					return os.date("%G-W%V", os.time())
				end,
				-- "2024-W09"
				isoprevweek = function()
					local adjustment = -7 * 24 * 60 * 60 -- One week in seconds
					return os.date("%G-W%V", os.time() + adjustment)
				end,
				-- "2024-W11"
				isonextweek = function()
					local adjustment = 7 * 24 * 60 * 60 -- One week in seconds
					return os.date("%G-W%V", os.time() + adjustment)
				end,
				-- "06"
				day_of_month = function()
					return os.date("%d", os.time())
				end,
				-- "03"
				month_numeric = function()
					return os.date("%m", os.time())
				end,
				-- "Wednesday"
				weekday = function()
					return os.date("%A", os.time())
				end,
			},
		},

		ui = { enable = false },
		disable_frontmatter = true, -- boolean or a function that takes a filename and returns a boolean.
		completion = { nvim_cmp = false },
		preferred_link_style = "wiki", -- 'wiki' or 'markdown'.
		mappings = {}, -- set 'mappings = {}' to disable keymappings

		---@param title string|?
		---@return string
		note_id_func = function(title)
			-- title: 'My new note' -> ID: '1657296016-my-new-note' -> file name: '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then -- transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else -- add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
					suffix = tostring(os.time()) .. "-" .. suffix
				end
			end
			-- use title as ID
			return suffix
		end,
	},
}
