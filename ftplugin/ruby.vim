let g:loaded_ruby_provider = 0

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
