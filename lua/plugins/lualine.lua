return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require('plugins.helpers')

			local colors = require('config.theme_colors')

			-- Define conditions for component visibility
			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand('%:p:h')
					local gitdir = vim.fn.finddir('.git', filepath .. ';')
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end
			}

			local theme = {
				normal = {
					a = { fg = colors.black, bg = colors.off_blue },
					b = { fg = colors.off_blue, bg = colors.black },
					c = { fg = colors.off_blue, bg = colors.black },
					z = { fg = colors.off_blue, bg = colors.black },
				},

				insert = {
					a = { fg = colors.black, bg = colors.off_blue },
					z = { fg = colors.off_blue, bg = colors.black }
				},
				visual = { a = { fg = colors.black, bg = colors.off_blue } },
				replace = {
					a = { fg = colors.black, bg = colors.red },
					z = { fg = colors.black, bg = colors.red }
				}
			}

			require('lualine').setup({
				options = {
					theme = theme,
					icons_enabled = true,
					component_separators = '',
					section_separators = { left = '', right = '' },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = true,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					}
				},
				sections = {
					lualine_a = {
						{
							'mode',
							fmt = function(res) return res:sub(1, 1) end,
							icons_enabled = true,
						}
					},
					lualine_b = {
						{
							'filename',
							file_status = true,
							path = 1, -- Show relative path
							shorting_target = 40,
							symbols = {
								modified = ' ●',
								readonly = ' ',
								unnamed = '[No Name]'
							}
						}
					},
					lualine_c = {
						{
							'branch',
							icon = '',
							color = function()
								local gs = git_status()
								if gs == 'd' then
									return { fg = colors.teal }
								elseif gs == 'm' then
									return { fg = colors.red }
								end
							end,
							cond = conditions.check_git_workspace,
						},
						{
							'diff',
							symbols = {
								added = ' ',
								modified = ' ',
								removed = ' '
							},
							cond = conditions.hide_in_width,
						},
					},
					lualine_x = {
						{
							'diagnostics',
							sources = { 'nvim_diagnostic' },
							symbols = {
								error = '',
								warn = '',
								info = ' ',
								hint = ' '
							}
						},
						'encoding',
						'filetype'
					},
					lualine_y = {
						{
							'fileformat',
							icons_enabled = true
						}
					},
					lualine_z = { { 'location', padding = { left = 0 } } }
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {
						{
							'filename',
							file_status = true,
							path = 1
						}
					},
					lualine_x = { 'location' },
					lualine_y = {},
					lualine_z = {}
				},
				extensions = { 'toggleterm' }
			})
		end,
	},
}
