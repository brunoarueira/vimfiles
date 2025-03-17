vim.cmd([[
  " VimFiles by Bruno Arueira
  " ==============================
  " http://github.com/brunoarueira/vimfiles

  set nocompatible
  syntax enable
  syntax sync fromstart
  filetype off

  lua require('config.settings')
  lua require('config.lazy')
  lua require('plugins')

  filetype plugin indent on

  lua require('config.theme')
  lua require('config.shortcuts')

  source ~/.config/nvim/config/filetypes.vimrc
  source ~/.config/nvim/config/functions.vimrc
]])
