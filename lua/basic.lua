-- Do not source the default filetypes.vim
vim.cmd [[set updatetime=300]]

local g, opt = vim.g, vim.opt

g.mapleader = ","

opt.shell = 'fish'
opt.shellquote = ''
opt.shellxquote = ''

g.do_filetype_lua = 1
g.did_load_filetypes = 0

-- Folding settings
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false
opt.foldlevel = 99

-- Performance settings
opt.maxmempattern = 10000 -- Increase max memory for pattern matching

-- Register markdown parser for MDX files
vim.treesitter.language.register('markdown', 'mdx')
