" Settings
"==================================

set shell=bash

" Completion
au FileType python set omnifunc=pythoncomplete#Complete
au FileType html   set omnifunc=htmlcomplete#CompleteTags
au FileType css    set omnifunc=csscomplete#CompleteCSS
au FileType xml    set omnifunc=xmlcomplete#CompleteTags

set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set autoindent
set smartindent
set shiftround

set completeopt=menu " don’t want to be bother by a popup showing me that there is a single match
set hidden " allow unsaved background buffers and remember marks/undo for them
set showcmd " display incomplete commands
set magic " For regular expressions turn magic on
set mat=2 " How many tenths of a second to blink when matching brackets

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

set ttyfast " Improve vim's scrolling speed
set lazyredraw

set ffs=unix,dos,mac " Use Unix as the standard file type

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

set clipboard+=unnamed " Yanks go on clipboard instead.
set history=256 " Number of things to remember in history.
set autowrite " Writes on make/shell commands
set ruler " Ruler on
set nu " Line numbers on
set relativenumber
set wrap " Line wrapping on

set ignorecase " Ignore case in searches

" Open splits at right side (and below)
set splitright
set splitbelow

" Disable swap/backup file
set nobackup
set nowb
set noswapfile

set textwidth=79
set formatoptions=qrn1

" Time out on key codes but not mappings
set notimeout
set timeout
set timeoutlen=300

if !has('nvim')
  set encoding=utf-8 nobomb
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" As seen on Vimcasts, expand path for the current file
let mapleader=','

" Project Specific vimrc
"=================================

set exrc " allow project-specific vimrc files to be sourced
set secure " make sure project-specific vimrc files don't do unsafe things

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
au BufEnter bash_profile set filetype=sh

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

" Change program used by :grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
