return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = { ensure_installed = { 'powershell' } },
	},
	{
		'mason-org/mason.nvim',
		opts = {
			ensure_installed = {
				'powershell-editor-services',
				'kube-linter',
			},
		},
	},
	{
		'TheLeoP/powershell.nvim',
		opts = {
			bundle_path = vim.fn.stdpath('data') .. '/mason/packages/powershell-editor-services',
		},
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = { 'DrKJeff16/wezterm-types' },
		opts = {
			servers = {
				tailwindcss = {
					settings = {
						tailwindCSS = {
							classFunctions = { 'cn', 'cva', 'clsx', 'twMerge' },
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								library = { vim.fn.stdpath('data') .. '/lazy/wezterm-types/lua' },
							},
						},
					},
				},
				yamlls = {
					settings = {
						yaml = {
							schemaStore = { enable = true },
							validate = true,
							schemas = {
								kubernetes = {
									'k8s/**/*.yaml',
									'k8s/**/*.yml',
									'manifests/**/*.yaml',
									'manifests/**/*.yml',
									'deploy/**/*.yaml',
									'deploy/**/*.yml',
									'*.k8s.yaml',
									'*.k8s.yml',
								},
								['https://json.schemastore.org/kustomization.json'] = {
									'kustomization.yaml',
									'kustomization.yml',
								},
								['https://json.schemastore.org/chart.json'] = {
									'Chart.yaml',
									'Chart.yml',
								},
								['https://json.schemastore.org/helmfile.json'] = {
									'helmfile.yaml',
									'helmfile.yml',
									'helmfile.d/**/*.yaml',
									'helmfile.d/**/*.yml',
								},
								['https://json.schemastore.org/helm-values.json'] = {
									'values.yaml',
									'values.yml',
									'values-*.yaml',
									'values-*.yml',
								},
							},
						},
					},
				},
			},
		},
	},
	{
		'mfussenegger/nvim-lint',
		opts = function(_, opts)
			local lint = require('lint')
			local sarif = require('lint.parser').for_sarif()

			lint.linters.kubelinter = {
				name = 'kubelinter',
				cmd = 'kube-linter',
				stdin = false,
				ignore_exitcode = true,
				args = { 'lint', '--format', 'sarif' },
				parser = function(output, bufnr)
					if output == '' then
						return {}
					end

					local decoded = vim.json.decode(output)
					if not decoded then
						return {}
					end

					local bufname = vim.api.nvim_buf_get_name(bufnr)
					local root = vim.fs.root(bufname, { '.git' }) or vim.fs.dirname(bufname)

					for _, run in ipairs(decoded.runs or {}) do
						for _, result in ipairs(run.results or {}) do
							for _, location in ipairs(result.locations or {}) do
								local artifact = location.physicalLocation
									and location.physicalLocation.artifactLocation
								local uri = artifact and artifact.uri

								if uri and not uri:match('^%a[%w+.-]*:') then
									artifact.uri = vim.uri_from_fname(
										vim.fs.normalize(vim.fs.joinpath(root, uri))
									)
								end
							end
						end
					end

					return sarif(vim.json.encode(decoded), bufnr)
				end,
			}

			opts.events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' }
			opts.linters_by_ft = opts.linters_by_ft or {}
			opts.linters_by_ft.yaml = { 'kubelinter' }
		end,
	},
}
