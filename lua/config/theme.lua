local api, o, cmd, opt = vim.api, vim.o, vim.cmd, vim.opt

-- o
o.hidden = true
o.emoji = true
o.signcolumn = 'auto:2'
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
opt.fillchars = ''
opt.cursorline = true

-- cmd
cmd.colorscheme 'nordic'

-- Highlight yank'd text after yankin'
api.nvim_create_augroup('YankHighlight', {})
api.nvim_create_autocmd('TextYankPost', {
    group = 'YankHighlight',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }
    end,
})
