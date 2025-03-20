local colors = require('config.theme_colors')

local highlight = function(group, options)
	local guifg   = options.fg or "NONE"
	local guibg   = options.bg or "NONE"
	local guisp   = options.sp or "NONE"
	local gui     = options.gui or "NONE"
	local blend   = options.blend or 0
	local ctermfg = options.ctermfg or "NONE"

	vim.cmd(
		string.format(
			"highlight %s guifg=%s ctermfg=%s guibg=%s guisp=%s gui=%s blend=%d",
			group,
			guifg,
			ctermfg,
			guibg,
			guisp,
			gui,
			blend
		)
	)
end

-- markdown
highlight("CodeBlock", { bg = colors.dark_gray })
highlight("Dash", { fg = colors.blue, gui = 'bold' })
highlight("Quote", { fg = colors.gray })

highlight("Headline1", { fg = colors.orange, bg = "#3D3C44", gui = 'bold' })
highlight("Headline2", { fg = colors.yellow, bg = "#3F4247", gui = 'bold' })
highlight("Headline3", { fg = colors.green, bg = "#394147", gui = 'bold' })
highlight("Headline4", { fg = colors.glacier, bg = "#363E4C", gui = 'bold' })
highlight("Headline5", { fg = colors.purple, bg = "#3a3c4a", gui = 'bold' })
highlight("Headline6", { fg = colors.darkest_white, bg = "#3d434f", gui = 'bold' })

return {
	"lukas-reineke/headlines.nvim",
	event = "VeryLazy",
	ft = { "markdown" },
	dependencies = "nvim-treesitter/nvim-treesitter",
	opts = {
		markdown = {
			fat_headline_lower_string = "▔",
			headline_highlights = {
				"Headline1",
				"Headline2",
				"Headline3",
				"Headline4",
				"Headline5",
				"Headline6",
			},
			codeblock_highlight = "CodeBlock",
			dash_highlight = "Dash",
			quote_highlight = "Quote"
		},
	}
}
