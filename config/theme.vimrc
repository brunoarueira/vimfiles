" Theme
"===================================

" Fonts for Mac
set guifont=Roboto\ for\ Mono:h14

set cursorline cursorcolumn " Highlight the line and the column of the current position of cursor

" True color support
if has('nvim')
  set termguicolors
endif

set title

set showmatch " Show matching brackets when text indicator is over them

" Folding settings
set foldmethod=manual
set nofoldenable " dont fold by default
set foldcolumn=1 " Add a bit extra margin to the left

" Invisible characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

set synmaxcol=2048 " Syntax coloring lines that are too long just slows down the world
set nojoinspaces " Use only 1 space after "." when joining lines instead of 2

set linespace=0

" Vertical / horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set cf " Enable error files & error jumping.

" Highlight all search results
set incsearch
set hlsearch

" Disable to show mode on the last row (show only inside status bar with
" vim-airline)
set noshowmode

set encoding=utf-8

set fillchars=""
let ayucolor="mirage"
colorscheme ayu
