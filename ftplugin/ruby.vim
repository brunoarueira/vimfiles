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
