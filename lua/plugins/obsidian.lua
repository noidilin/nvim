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
					{ "<leader>no", ":ObsidianOpen<cr>", desc = "open in obsidian", icon = { icon = "" } },
					-- { "<leader>nT", ":ObsidianNewFromTemplate<cr>", desc = "template", icon = { icon = "" }, },
					-- { "<leader>np", ":ObsidianPasteImg<cr>", desc = "paste img", icon = { icon = "" }, },
					{ "<leader>nr", ":ObsidianRename<cr>", desc = "rename", icon = { icon = "" } },
					{ "<leader>nx", ":ObsidianExtractNote<cr>", mode = "v", desc = "extract", icon = { icon = "" } },
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
			-- A map for custom variables, the key should be the variable and the value a function
			substitutions = {
				-- substitute template variable {{yesterday}} when inserting a template.
				--[[ yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end ]]
			},
		},

		ui = { enable = false },
		disable_frontmatter = true, -- boolean or a function that takes a filename and returns a boolean.
		completion = { nvim_cmp = false },
		preferred_link_style = "wiki", -- 'wiki' or 'markdown'.

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
			return suffix
		end,

		-- set 'mappings = {}' to disable keymappings
		mappings = {
			-- normal 'go to definition' in neovim can't reach to link like this [[name#heading]]
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},

		-- specify how to handle attachments.
		attachments = {
			-- If this is a relative path it will be interpreted as relative to the vault root.
			-- You can always override this per image by passing a full path to the command instead of just a filename.
			img_folder = "extra/asset", -- folder to place images in via `:ObsidianPasteImg`

			-- customize the name or prefix when pasting images via `:ObsidianPasteImg`.
			---@return string
			img_name_func = function()
				return string.format("%s", os.date("R_%Y%m%d%H%M%S")) -- prefix image names with timestamp.
			end,

			-- A function that determines the text to insert in the note when pasting an image.
			-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
			-- This is the default implementation.
			---@param client obsidian.Client
			---@param path obsidian.Path the absolute path to the image file
			---@return string
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format("![%s](%s)", path.name, path)
			end,
		},
	},
}
