" Plugins
"==========================================

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

let g:user_emmet_leader_key='<leader>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}

" Configure ALE error msgs.
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
	\ 'javascript': ['eslint'],
	\ 'ruby': ['rubocop']
	\}
let g:ale_completion_enabled = 1
nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
