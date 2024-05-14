-- Do not source the default filetypes.vim
vim.cmd [[set updatetime=300]]

local g, opt = vim.g, vim.opt

g.mapleader = ","

opt.shell = 'fish'
opt.shellquote = ''
opt.shellxquote = ''

g.do_filetype_lua = 1
g.did_load_filetypes = 0
