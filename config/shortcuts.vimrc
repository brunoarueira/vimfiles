" Shortcuts
"===================================

" Bind K to search for the word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" NERDTree
nmap <F2> :NERDTreeToggle<CR>

" Tabular
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
" key => value
nmap <leader>t> :Tabularize /=><CR>
vmap <leader>t> :Tabularize /=><CR>
" key: value
nmap <leader>t: :Tabularize /:\zs<CR>
vmap <leader>t: :Tabularize /:\zs<CR>
" Ruby symbols
nmap <leader>ts :Tabularize /:/l1c0l0<CR>
vmap <leader>ts :Tabularize /:/l1c0l0<CR>
cnoreabbrev Tab Tabularize

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

map <leader>r :so ~/.vimrc<CR>

map <leader><space> :noh<CR>

" Mapping Y to yank from current cursor position till end of line
noremap Y y$

" Ctrl+L clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>

" A trick for when you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts).
" This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null

" Faster commands
nnoremap ; :

" Fast saving
noremap <leader>w :w<CR>

" TAB idents, STab unindents
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv

" toggle comment
map <silent> <Leader>c :TComment<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Add keyboard shortcuts for navigating splits
map <C-down> <c-w>j
map <C-up> <c-w>k
map <C-right> <c-w>l
map <C-left> <c-w>h

" Move between tabs
nnoremap <F3> gt
nnoremap <F4> gT
