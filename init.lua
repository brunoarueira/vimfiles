vim.cmd([[
  " VimFiles by Bruno Arueira
  " ==============================
  " http://github.com/brunoarueira/vimfiles

  set nocompatible
  syntax enable
  syntax sync fromstart
  filetype off

  lua require('plugins')

  filetype plugin indent on

  source ~/.config/nvim/config/general.vimrc

  lua require('brunoarueira.theme')

  lua require('basic')
  lua require('shortcuts')

  source ~/.config/nvim/config/plugin_configs.vimrc
  source ~/.config/nvim/config/filetypes.vimrc
  source ~/.config/nvim/config/functions.vimrc
]])
