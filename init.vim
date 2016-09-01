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

call vundle#end()

filetype plugin indent on

set shell=bash

" Plugins
"==========================================

" NERDTree
nmap <F2> :NERDTreeToggle<CR>

" Tabular
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
" key => value
nmap <leader>t> :Tabularize /=><CR>
vmap <leader>t> :Tabularize /=><CR>
" key: value
nmap <leader>t: :Tabularize /:\zs<CR>
vmap <leader>t: :Tabularize /:\zs<CR>
" Ruby symbols
nmap <leader>ts :Tabularize /:/l1c0l0<CR>
vmap <leader>ts :Tabularize /:/l1c0l0<CR>
cnoreabbrev Tab Tabularize

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$'
  \ }

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Syntastic configs
let g:syntastic_check_on_open = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_jump = 0
let g:syntastic_error_symbol = 'e:'
let g:syntastic_warning_symbol = 'w:'
let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [
                           \ 'ruby',
                           \ 'javascript',
                           \ 'css',
                           \ 'eruby',
                           \ 'scss',
                           \ 'sh',
                           \ 'yaml'],
                           \ 'passive_filetypes': ['html'] }

let g:syntastic_stl_format = ""
      \ . "%W{"
      \ . "[" . g:syntastic_warning_symbol . " %fw(%w)]"
      \ . "}"
      \ . "%E{"
      \ . "[" . g:syntastic_error_symbol . " %fe(%e)]"
      \ . "}"

let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['jscs']

" vim-airline
set laststatus=2
let g:airline_theme='tomorrow'
let g:airline_inactive_collapse=1
let g:airline#extensions#branch#displayed_head_limit = 15
let g:airline#extensions#branch#empty_message = ''
let g:airline_powerline_fonts = 1

" Bind K to search for the word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Settings
"==================================

" Completion
au FileType python set omnifunc=pythoncomplete#Complete
au FileType html   set omnifunc=htmlcomplete#CompleteTags
au FileType css    set omnifunc=csscomplete#CompleteCSS
au FileType xml    set omnifunc=xmlcomplete#CompleteTags

set t_Co=256

" Autoindent with two spaces, always expand tabs
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set autoindent
set smartindent
set shiftround

set title

" don’t want to be bother by a popup showing me that there is a single match
set completeopt=menu

" allow unsaved background buffers and remember marks/undo for them
set hidden

" display incomplete commands
set showcmd

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Improve vim's scrolling speed
set ttyfast
" set ttyscroll=3
set lazyredraw

" Folding settings
set foldmethod=manual
set nofoldenable        " dont fold by default

" Add a bit extra margin to the left
set foldcolumn=1

if !has('nvim')
  set encoding=utf-8 nobomb
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Invisible characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1200

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

set wildmode=longest,list
set wildmenu " enable ctrl-n and ctrl-p to scroll thru matches

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Ignore images and log files
set wildignore+=*.gif,*.jpg,*.png,*.log

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Disable osx index files
set wildignore+=.DS_Store

set linespace=0

" Vertical / horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set cf " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set history=256 " Number of things to remember in history.
set autowrite " Writes on make/shell commands
set ruler " Ruler on
set nu " Line numbers on
set relativenumber
set wrap " Line wrapping on

" Highlight all search results
set incsearch
set hlsearch

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Ignore case in searches
set ignorecase

" Open splits at right side (and below)
set splitright
set splitbelow

" Disable swap/backup file
set nobackup
set nowb
set noswapfile

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Disable to show mode on the last row (show only inside status bar with
" vim-airline)
set noshowmode

set textwidth=79
set formatoptions=qrn1

" Time out on key codes but not mappings
set notimeout
set timeout
set timeoutlen=300

" As seen on Vimcasts, expand path for the current file
let mapleader=','

" Shortcuts
"===================================

map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

map <leader>r :so ~/.vimrc<CR>

map <leader><space> :noh<CR>

" Mapping Y to yank from current cursor position till end of line
noremap Y y$

" Ctrl+L clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>

" A trick for when you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts).
" This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null

" Faster commands
nnoremap ; :

" Fast saving
noremap <leader>w :w<CR>

" TAB idents, STab unindents
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv

" toggle comment
map <silent> <Leader>c :TComment<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Add keyboard shortcuts for navigating splits
map <C-down> <c-w>j
map <C-up> <c-w>k
map <C-right> <c-w>l
map <C-left> <c-w>h

" Move between tabs
nnoremap <F3> gt
nnoremap <F4> gT

" Theme
"===================================

" Fonts for Mac
set guifont=Monaco\ for\ Powerline:h14

set guioptions-=T
set guioptions-=m "remove menu bar

set background=dark
let base16colorspace=256 " Access colors present in 256 colorspace

" Highlight the line and the column of the current position of cursor
set cursorline cursorcolumn

colorscheme Tomorrow-Night-Eighties

" Functions
"=================================

map <leader>= :call StripTrailingWhitespaces()<CR>
map! <leader>= :call StripTrailingWhitespaces()<CR>

" Automatically remove whitespaces while saving files
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" As seen on Vimcasts
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business
  %s/\s\+$//e
  " Clean up: restore previous search history and cursor position
  let @/=_s
  call cursor(l,c)
endfunction

" sort words
vmap <leader>s d:execute 'normal a' . join(sort(split(getreg('"'))), ' ')<CR>

" Collapse multiple blank lines (regardless of quantity) into a single blank line.
function! CollapseMultipleBlankLines()
  g/^\_$\n\_^$/d
  ''
:endfunction
:map <leader>- :call CollapseMultipleBlankLines()<CR>
:map! <leader>- :call CollapseMultipleBlankLines()<CR>

" Invert lines
function! InvertLines()
  g/^/m0
  ''
:endfunction
nnoremap <leader>il :call InvertLines()<cr>

" Creates parent directories on save
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Wrap the word under the cursor in quotes. If in ruby mode,
" cycle between quoting styles and symbols.
"
" variable -> "variable" -> 'variable' -> :variable
"
function! QuoteSwitcher()
  let l:type = strpart( expand("<cWORD>"), 0, 1 )
  let l:word = expand("<cword>")

  if l:type == '"'
    " Double quote to single
    execute ":normal viWc'" . l:word . "'"
  elseif l:type == "'"
    if &ft == 'ruby' || &ft == 'rspec'
      " Single quote to symbol
      execute ':normal viWc:' . l:word
    else
      " Single quote to double
      execute ':normal viWc"' . l:word . '"'
    end
  else
    " Whatever to double quote
    execute ':normal viWc"' . l:word . '"'
  endif

  " Move the cursor back into the cl:word
  call cursor( 0, getpos('.')[2] - 1 )
endfunction
nnoremap <leader>qs :call QuoteSwitcher()<cr>

" Project Specific vimrc
"=================================

" allow project-specific vimrc files to be sourced
set exrc
" make sure project-specific vimrc files don't do unsafe things
set secure

" Aliases
"=================================

cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq

" Syntax Highlighting
"================================

au BufEnter .psqlrc      set filetype=sql
au BufEnter *.less       set filetype=css
au BufEnter bash_profile set filetype=sh
