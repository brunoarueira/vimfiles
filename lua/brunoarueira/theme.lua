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

cmd [[
  highlight Normal guibg=NONE
  highlight SignColumn guibg=NONE
  highlight VertSplit guibg=NONE
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

-- LSP color highlight
cmd("highlight DiagnosticError guifg=" .. colors.red)
cmd("highlight DiagnosticWarn guifg=" .. colors.yellow)
cmd("highlight DiagnosticInfo guifg=" .. colors.off_blue)
cmd("highlight DiagnosticHint guifg=" .. colors.teal)
