vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
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
