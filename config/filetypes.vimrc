autocmd FileType css,html,ruby,eruby,yaml,sql,json,lua,javascript,typescript,typescriptreact,astro setlocal shiftwidth=2 tabstop=2 expandtab

autocmd FileType sql setlocal formatoptions=croqnl1 foldmethod=indent foldlevel=1

autocmd FileType go setlocal shiftwidth=8 tabstop=8 expandtab

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

autocmd FileType md setlocal textwidth=80
