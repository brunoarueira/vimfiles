" Plugins
"==========================================

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$'
  \ }

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Syntastic configs
let g:syntastic_check_on_open = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_jump = 0
let g:syntastic_error_symbol = 'e:'
let g:syntastic_warning_symbol = 'w:'
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

let g:syntastic_javascript_eslint_exec = './node_modules/bin/eslint'

" vim-airline
set laststatus=2
let g:airline_theme='tomorrow'
let g:airline_inactive_collapse=1
let g:airline#extensions#branch#displayed_head_limit = 15
let g:airline#extensions#branch#empty_message = ''
let g:airline_powerline_fonts = 1
