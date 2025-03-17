-- VimFiles by Bruno Arueira
-- ==============================
-- http://github.com/brunoarueira/vimfiles

vim.cmd([[
  set nocompatible
  syntax enable
  syntax sync fromstart
  filetype off
]])

require('config.settings')
require('config.lazy')
require('plugins')

vim.cmd [[filetype plugin indent on]]

require('config.theme')
require('config.shortcuts')

vim.cmd([[
  source ~/.config/nvim/config/functions.vimrc
]])
