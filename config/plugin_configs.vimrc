" Plugins
"==========================================

" Syntastic configs
let g:syntastic_check_on_open = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_jump = 0
let g:syntastic_error_symbol = 'e:'
let g:syntastic_warning_symbol = 'w:'
let g:syntastic_style_error_symbol = '⚡'
let g:syntastic_error_symbol = '✗'
" '⚡' '😱' '✗' '➽'
" other cool characters:
" ⚑ ⚐ ♒ ⛢ ❕ ❗
let g:syntastic_warning_symbol = '⚠'
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
let g:syntastic_javascript_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']

let g:syntastic_javascript_eslint_exe = 'eslint_d'
let g:syntastic_aggregate_errors = 1

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
set laststatus=2
let g:airline#extensions#branch#enabled=1

if has('nvim')
" define the set of text to display for each mode.  >
let g:airline_mode_map = {
\ '__' : '-',
\ 'n'  : 'N',
\ 'i'  : 'I ',
\ 'R'  : 'R',
\ 'c'  : 'C',
\ 'v'  : 'ಠ',
\ 'V'  : 'V-LINE',
\ 'x' : 'V-BLOCK',
\ 's'  : 'S',
\ 'S'  : 'S',
\ '' : 'S-BLOCK',
\ }
end

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
