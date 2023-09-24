local colors = require('brunoarueira.colors')

local api, o, cmd, opt = vim.api, vim.o, vim.cmd, vim.opt

-- o
o.hidden = true
o.emoji = true
o.signcolumn = 'yes:1'
o.shortmess = 'filnxtToOFc' -- Avoid showing extra messages when using completion
o.formatoptions = 'cqrnj'
o.termguicolors = true

-- opt
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
opt.showmode = false
opt.sidescroll = 1
opt.cf = true
opt.incsearch = true
opt.hlsearch = true
opt.fillchars = ""
opt.cursorline = true

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

vim.cmd("highlight Normal guibg=NONE")
vim.cmd("highlight SignColumn guibg=NONE")
vim.cmd("highlight VertSplit guibg=NONE")

-- LSP color highlight
vim.cmd("highlight DiagnosticError guifg=" .. colors.red)
vim.cmd("highlight DiagnosticWarn guifg=" .. colors.yellow)
vim.cmd("highlight DiagnosticInfo guifg=" .. colors.lightblue)
vim.cmd("highlight DiagnosticHint guifg=" .. colors.cyan)
