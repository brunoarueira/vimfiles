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
