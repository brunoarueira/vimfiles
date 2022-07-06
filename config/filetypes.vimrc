autocmd FileType css,html,ruby,eruby,yaml,javascript,javascript.jsx,sql,json setlocal shiftwidth=2 tabstop=2 expandtab

autocmd FileType sql setlocal formatoptions=croqnl1 foldmethod=indent foldlevel=1

autocmd FileType go setlocal shiftwidth=8 tabstop=8 expandtab

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

au BufRead,BufNewFile *.tsx setlocal filetype=javascript.jsx
au BufRead,BufNewFile *.ts  setlocal filetype=javascript

autocmd FileType md setlocal textwidth=80
