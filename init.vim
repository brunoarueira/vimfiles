" VimFiles by Bruno Arueira
" ==============================
" http://github.com/brunoarueira/vimfiles

set nocompatible
syntax enable
syntax sync fromstart
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'dag/vim-fish'
Plugin 'danro/rename.vim'
Plugin 'godlygeek/tabular'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'int3/vim-extradite'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ap/vim-css-color'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/gitignore'
Plugin 'bogado/file-line'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mxw/vim-jsx'

call vundle#end()

filetype plugin indent on

source ~/.vim/config/general.vimrc
source ~/.vim/config/plugin_configs.vimrc
source ~/.vim/config/shortcuts.vimrc
source ~/.vim/config/theme.vimrc
source ~/.vim/config/functions.vimrc
