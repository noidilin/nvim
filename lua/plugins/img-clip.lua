-- ref - https://github.com/linkarzu/dotfiles-latest
-- ISSUE: [content is not an image #13](https://github.com/HakonHarnes/img-clip.nvim/issues/13)
-- It might has some issue with powershell command. Try inspect with the command ":ImgClipDebug"

return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	opts = {
		default = {
			-- file and directory options
			dir_path = "./extra/asset", ---@type string | fun(): string
			extension = "avif", ---@type string | fun(): string
			file_name = "r-%Y%m%d%H%M%S", ---@type string | fun(): string
			-- disable absolute path to switch device easily
			use_absolute_path = false, ---@type boolean | fun(): boolean
			-- if set to false, image will be created in cwd
			relative_to_current_file = false, ---@type boolean | fun(): boolean

			-- template options
			insert_mode_after_paste = false, ---@type boolean | fun(): boolean
			prompt_for_file_name = false, ---@type boolean | fun(): boolean

			-- image options
			process_cmd = "convert - -quality 75 avif:-", ---@type string | fun(): string
			-- process_cmd = "convert - -quality 75 -resize 50% jpg:-", ---@type string | fun(): string
			copy_images = true, ---@type boolean | fun(): boolean
		},

		-- filetype specific options
		filetypes = {
			markdown = {
				-- encode spaces and special characters in file path
				url_encode_path = true, ---@type boolean | fun(): boolean

				-- template specifies how text and path of the image will appear in files
				-- 1. $FILE_NAME: automatically fill in "file_name" value as display text.
				-- 2. $CURSOR: paste image and place cursor in there to type the display text (not filename)
				-- 3. plain text: plain text for every display text
				template = "![$FILE_NAME]($FILE_PATH)", ---@type string | fun(context: table): string
				-- template = "![$CURSOR]($FILE_PATH)", ---@type string | fun(context: table): string
				-- template = "![Image]($FILE_PATH)", ---@type string
			},
		},
	},
	-- { "<leader>np", "<cmd>PasteImage<cr>", desc = "paste img", icon = { icon = "" }, },
	keys = { { "<leader>np", "<cmd>PasteImage<cr>", desc = "paste img" } },
}
