local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone wbthomason/packer.nvim' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes to plugins.lua

local packer = require('packer')

packer.init({
  git = {
    clone_timeout = 300
  },
  profile = {
    enable = true
  }
})

return packer.startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }

  use 'ervandew/supertab'
  use 'vim-airline/vim-airline'
  use 'ryanoasis/vim-devicons'
  use 'danro/rename.vim'
  use 'godlygeek/tabular'
  use 'gorkunov/smartpairs.vim'
  use 'tomtom/tlib_vim'
  use 'MarcWeber/vim-addon-mw-utils'
  use 'int3/vim-extradite'
  use 'pangloss/vim-javascript'

  use { 'rstacruz/sparkup', rtp = 'vim/' }

  use 'scrooloose/nerdtree'
  use 'ap/vim-css-color'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-abolish'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-git'
  use 'tpope/vim-rails'
  use 'vim-ruby/vim-ruby'
  use 'vim-scripts/gitignore'
  use 'bogado/file-line'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'jasonshell/vim-svg-indent'
  use 'terryma/vim-multiple-cursors'
  use '/usr/local/opt/fzf'
  use 'junegunn/fzf.vim'
  use 'victormours/ruby-memoize.vim'
  use 'jparise/vim-graphql'
  use 'mattn/emmet-vim'
  use 'w0rp/ale'

  use {
    'sourcegraph/javascript-typescript-langserver',
    ft = 'javascript',
    run = 'npm install && npm run build'
  }

  use 'arcticicestudio/nord-vim'
  use 'rust-lang/rust.vim'

  -- JSON front matter highlight use
  use 'elzr/vim-json'
  use 'plasticboy/vim-markdown'
  use 'editorconfig/editorconfig-vim'
end)
