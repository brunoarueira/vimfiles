" Plugins
"==========================================

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

let g:user_emmet_leader_key='<leader>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}

" fzf

" hide status and ruler for cleaner fzf windows
if has('nvim')
  au FileType fzf set laststatus& laststatus=0 | au BufLeave <buffer> set laststatus&
endif

