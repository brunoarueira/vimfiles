autocmd BufRead,BufNewFile Guardfile            set filetype=ruby
autocmd BufRead,BufNewFile .pryrc               set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile          set filetype=ruby
autocmd BufRead,BufNewFile Capfile              set filetype=ruby
autocmd BufRead,BufNewFile Gemfile              set filetype=ruby
autocmd BufRead,BufNewFile *gemfile*,*.gemfile  set filetype=ruby

autocmd FileType ruby,eruby setlocal shiftwidth=2 tabstop=2 expandtab

" Completion
au FileType ruby,eruby set omnifunc=syntaxcomplete#Complete

au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_rails = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
