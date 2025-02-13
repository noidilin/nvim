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
	-- C:/Users/noid/.local/share/obsidian/**.md
	-- D:/area/obsidian/**.md
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
					mode = { "n" },
					-- note that `<cmd>ObsidianExtractNote<cr>` and `:ObsidianExtractNote<cr>` are not equal.
					{ "<leader>n", group = "+obsidian", icon = { icon = "" } },
					{ "<leader>nc", ":ObsidianNew<cr>", desc = "new file", icon = { icon = "" } },
					{ "<leader>n]", ":ObsidianLinks<cr>", desc = "links", icon = { icon = "" } },
					{ "<leader>n[", ":ObsidianBacklinks<cr>", desc = "backlinks", icon = { icon = "󰌷" } },
					{ "<leader>nd", ":ObsidianToday<cr>", desc = "daily", icon = { icon = "" } },
					{ "<leader>nt", ":ObsidianTemplate<cr>", desc = "snippet", icon = { icon = "" } },
					{ "<leader>no", ":ObsidianOpen<cr>", desc = "open in obsidian", icon = { icon = "" } },
					-- { "<leader>nT", ":ObsidianNewFromTemplate<cr>", desc = "template", icon = { icon = "" }, },
					-- { "<leader>np", ":ObsidianPasteImg<cr>", desc = "paste img", icon = { icon = "" }, },
					{ "<leader>nr", ":ObsidianRename<cr>", desc = "rename", icon = { icon = "" } },
					{
						"<leader>n",
						":ObsidianExtractNote<cr>",
						mode = "v",
						desc = "obsidian: extract note",
						icon = { icon = "" },
					},
				},
			},
		},
	},
	opts = {
		workspaces = {
			{
				name = "obsidian",
				-- path = vim.fn.expand("$XDG_DATA_HOME") .. "/obsidian",
				path = VAULT_PATH,
				overrides = {},
			},
		},

		-- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
		-- 'workspaces'. For example:
		-- dir = "~/vaults/work",

		-- Optional, if you keep notes in a specific subdirectory of your vault.
		notes_subdir = "source",

		daily_notes = {
			folder = "calendar/daily", -- Optional, if you keep daily notes in a separate directory.
			date_format = "%Y-%m-%d", -- Optional, if you want to change the date format for the ID of daily notes.
			-- alias_format = "%B %-d, %Y", -- Optional, if you want to change the date format of the default alias of daily notes.
			-- default_tags = { "daily-notes" }, -- Optional, default tags to add to each new daily note created.

			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = "extra/templates/daily.md",
		},

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		completion = {
			nvim_cmp = false, -- Set to false to disable completion.
			min_chars = 2, -- Trigger completion at 2 chars.
		},

		-- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
		-- way then set 'mappings = {}'.
		mappings = {
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},

		-- Where to put new notes. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "notes_subdir",

		-- Optional, customize how note IDs are generated given an optional title.
		---@param title string|?
		---@return string
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,

		-- Optional, customize how note file names are generated given the ID, target directory, and title.
		---@param spec { id: string, dir: obsidian.Path, title: string|? }
		---@return string|obsidian.Path The full path to the new note.
		note_path_func = function(spec)
			-- This is equivalent to the default behavior.
			-- local path = spec.dir / tostring(spec.id)
			local path = spec.dir / tostring(spec.title) -- use title as file name
			return path:with_suffix(".md")
		end,

		-- Optional, customize how wiki links are formatted. You can set this to one of:
		--  * "use_alias_only", e.g. '[[Foo Bar]]'
		--  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
		--  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
		--  * "use_path_only", e.g. '[[foo-bar.md]]'
		--
		-- Or you can set it to a function that takes a table of options and returns a string, like this:
		--[[ wiki_link_func = function(opts)
			return require("obsidian.util").wiki_link_id_prefix(opts)
		end, ]]
		--
		-- Optional, customize how markdown links are formatted.
		--[[ markdown_link_func = function(opts)
			return require("obsidian.util").markdown_link(opts)
		end, ]]

		-- Either 'wiki' or 'markdown'.
		preferred_link_style = "wiki",

		-- Optional, boolean or a function that takes a filename and returns a boolean.
		-- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
		disable_frontmatter = true,

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

		-- Specify how to handle attachments.
		attachments = {
			-- The default folder to place images in via `:ObsidianPasteImg`.
			-- If this is a relative path it will be interpreted as relative to the vault root.
			-- You can always override this per image by passing a full path to the command instead of just a filename.
			img_folder = "extra/asset", -- This is the default

			-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
			---@return string
			img_name_func = function()
				-- Prefix image names with timestamp.
				return string.format("%s", os.date("R_%Y%m%d%H%M%S"))
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
