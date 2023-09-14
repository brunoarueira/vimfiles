local api, o, cmd, highlight, opt = vim.api, vim.o, vim.cmd, vim.highlight, vim.opt

-- o
o.hidden = true
o.emoji = true
o.signcolumn = 'yes:1'
o.completeopt = 'menu,menuone,noselect'
o.shortmess = 'filnxtToOFc' -- Avoid showing extra messages when using completion
o.formatoptions = 'cqrnj'
o.termguicolors = true

-- opt
opt.showmode = false
opt.sidescroll = 1
opt.cf = true
opt.incsearch = true
opt.hlsearch = true
opt.fillchars = ""

-- cmd
cmd.colorscheme('nord')

-- Highlight yank'd text after yankin'
api.nvim_create_augroup("YankHighlight", {})
api.nvim_create_autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})


