return {
	{
		'HakonHarnes/img-clip.nvim',
		cmd = 'PasteImage',
		ft = { 'markdown', 'md', 'rmd', 'quarto' },
		keys = {
			{ '<leader>mp', '<cmd>PasteImage<cr>', desc = 'paste image into markdown' },
		},
		opts = {
			default = {
				dir_path = 'img',
				extension = 'webp',
				process_cmd = 'magick - webp:-',
				file_name = '%Y%m%d-%H%M%S',
				use_absolute_path = false,
				relative_to_current_file = true,
				relative_template_path = true,
				insert_mode_after_paste = false,
				prompt_for_file_name = false,
				copy_images = true,
				download_images = true,
			},
			filetypes = {
				markdown = {
					url_encode_path = true,
					template = '![$FILE_NAME_NO_EXT]($FILE_PATH)',
					download_images = true,
				},
			},
		},
	},
}
