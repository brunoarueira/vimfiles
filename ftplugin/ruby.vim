" Completion
set omnifunc=syntaxcomplete#Complete

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1

" Convert Ruby 1.8 to 1.9 Hash Syntax - http://robots.thoughtbot.com/convert-ruby-1-8-to-1-9-hash-syntax
function! ConvertRubyHashSyntax()
  %s/:\([^ ]*\)\(\s*\)=>/\1:/g
  ''
:endfunction
nnoremap <leader>h :call ConvertRubyHashSyntax()<CR>

" Promote variable to rspec let
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

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
