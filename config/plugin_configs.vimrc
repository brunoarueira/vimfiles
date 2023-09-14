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

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" vim-markdown
" disable header folding
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'shell=sh']

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" fzf

" hide status and ruler for cleaner fzf windows
if has('nvim')
  au FileType fzf set laststatus& laststatus=0 | au BufLeave <buffer> set laststatus&
endif

