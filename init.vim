" VimFiles by Bruno Arueira
" ==============================
" http://github.com/brunoarueira/vimfiles

set nocompatible
syntax enable
syntax sync fromstart
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ayu-theme/ayu-vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'danro/rename.vim'
Plugin 'godlygeek/tabular'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'int3/vim-extradite'
Plugin 'pangloss/vim-javascript'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-css-color'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-git'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/gitignore'
Plugin 'bogado/file-line'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mxw/vim-jsx'
Plugin 'jasonshell/vim-svg-indent'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/fzf.vim'
Plugin 'victormours/ruby-memoize.vim'
Plugin 'jparise/vim-graphql'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'sourcegraph/javascript-typescript-langserver', {'for': ['javascript'], 'do': 'npm install && npm run build'}

call vundle#end()

filetype plugin indent on

source ~/.vim/config/general.vimrc
source ~/.vim/config/theme.vimrc
source ~/.vim/config/plugin_configs.vimrc
source ~/.vim/config/shortcuts.vimrc
source ~/.vim/config/filetypes.vimrc
source ~/.vim/config/functions.vimrc
