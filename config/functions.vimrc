" Functions
"=================================

command! FormatJSON %!jq '.'

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

let s:k_be = [ 'do', 'end' ]
function! s:ToggleBeginOrBracket()
  let c = matchstr(getline('.'), '\%' . col('.') . 'c.')

  if c =~ '[{}]'
    " don't use matchit for {,}
    exe 'normal! %s'.s:k_be[1-(c=='}')]."\<esc>``s".s:k_be[(c=='}')]."\<esc>"
  else
    let w = expand('<cword>')
    if w == 'begin' || w == 'do'
      " use matchit
      normal %
      exe "normal! ciw}\<esc>``ciw{\<esc>"
    elseif w == 'end'
      " use mathit
      normal %
      exe "normal! ciw{\<esc>``ciw}\<esc>"
    else
      throw 'Cannot toggle block: cursor is not on {, }, begin/do nor end'
    endif
  endif
endfunction
:map <leader>[ :call <sid>ToggleBeginOrBracket()<CR>
:map! <leader>[ :call <sid>ToggleBeginOrBracket()<CR>
