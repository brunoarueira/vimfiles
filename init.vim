" VimFiles by Bruno Arueira
" ==============================
" http://github.com/brunoarueira/vimfiles

set nocompatible
syntax enable
syntax sync fromstart
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/

let uname = substitute(system('uname'), '\n', '', '')

if uname == 'Linux'
  set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
else
  set rtp+=/usr/local/opt/fzf
endif

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'danro/rename.vim'
Plugin 'godlygeek/tabular'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'int3/vim-extradite'
Plugin 'pangloss/vim-javascript'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-css-color'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/gitignore'
Plugin 'bogado/file-line'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'jasonshell/vim-svg-indent'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'victormours/ruby-memoize.vim'
Plugin 'jparise/vim-graphql'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'sourcegraph/javascript-typescript-langserver', {'for': ['javascript'], 'do': 'npm install && npm run build'}
Plugin 'arcticicestudio/nord-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
" JSON front matter highlight plugin
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()

filetype plugin indent on

source ~/.config/nvim/config/general.vimrc
source ~/.config/nvim/config/theme.vimrc
source ~/.config/nvim/config/plugin_configs.vimrc
source ~/.config/nvim/config/shortcuts.vimrc
source ~/.config/nvim/config/filetypes.vimrc
source ~/.config/nvim/config/functions.vimrc
