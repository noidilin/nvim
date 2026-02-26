-- NOTE: much more slower than hipatter, and some tailwind syntax written in variants can't be highlighted
-- stylua: ignore
if true then return {} end

return {
	'brenoprata10/nvim-highlight-colors',
	event = 'VeryLazy',
	opts = {
		---Render style
		---@usage 'background'|'foreground'|'virtual'
		render = 'virtual',
		---Set virtual symbol (requires render to be set to 'virtual')
		virtual_symbol = '■',
		virtual_symbol_prefix = '',
		virtual_symbol_suffix = ' ',
		---Set virtual symbol position()
		---@usage 'inline'|'eol'|'eow'
		virtual_symbol_position = 'inline',
		enable_tailwind = false,
		---Set custom colors: Label must be properly escaped with '%' to adhere to `string.gmatch`
		custom_colors = {
			{ label = '%-%-theme%-primary%-color', color = '#0f1219' },
			{ label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
		},
		-- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
		exclude_filetypes = {},
		exclude_buftypes = {},
	},
	dependencies = {
		{
			'saghen/blink.cmp',
			opts = {
				completion = {
					menu = {
						draw = {
							components = {
								-- customize the drawing of kind icons
								kind_icon = {
									text = function(ctx)
										-- default kind icon
										local icon = ctx.kind_icon
										-- if LSP source, check for color derived from documentation
										if ctx.item.source_name == 'LSP' then
											local color_item =
												require('nvim-highlight-colors').format(
													ctx.item.documentation,
													{ kind = ctx.kind }
												)
											if color_item and color_item.abbr ~= '' then
												icon = color_item.abbr
											end
										end
										return icon .. ctx.icon_gap
									end,
									highlight = function(ctx)
										-- default highlight group
										local highlight = 'BlinkCmpKind' .. ctx.kind
										-- if LSP source, check for color derived from documentation
										if ctx.item.source_name == 'LSP' then
											local color_item =
												require('nvim-highlight-colors').format(
													ctx.item.documentation,
													{ kind = ctx.kind }
												)
											if color_item and color_item.abbr_hl_group then
												highlight = color_item.abbr_hl_group
											end
										end
										return highlight
									end,
								},
							},
						},
					},
				},
			},
		},
	},
}
