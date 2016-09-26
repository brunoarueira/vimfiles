autocmd BufNewFile,BufRead *.json set filetype=javascript

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab

" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction
