local map = function(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local nmap = function(shortcut, command)
  map('n', shortcut, command)
end

local imap = function(shortcut, command)
  map('i', shortcut, command)
end

local vmap = function(shortcut, command)
  map('v', shortcut, command)
end

local cmap = function(shortcut, command)
  map('c', shortcut, command)
end

-- Faster commands
nmap(';', ':')

-- Fast saving
nmap('<leader>w', ':w<CR>')

-- Finding in files
nmap('<Leader>s', ':Rg<CR>')

-- NERDTree
nmap('<F2>', ':NERDTreeToggle<CR>')

-- Tabular
nmap('<leader>t=', ':Tabularize /=<CR>')
vmap('<leader>t=', ':Tabularize /=<CR>')

-- key => value
nmap('<leader>t>', ':Tabularize /=><CR>')
vmap('<leader>t>', ':Tabularize /=><CR>')

-- key: value
nmap('<leader>t:', ':Tabularize /:\zs<CR>')
vmap('<leader>t:', ':Tabularize /:\zs<CR>')

-- Ruby symbols
nmap('<leader>ts', ':Tabularize /:/l1c0l0<CR>')
vmap('<leader>ts', ':Tabularize /:/l1c0l0<CR>')

vim.cmd [[
cnoreabbrev Tab Tabularize

au FileType markdown map <Bar> vip :Tabularize /<Bar><CR>
]]

-- Vmap for maintain Visual Mode after shifting > and <
vmap('<', '<gv')
vmap('>', '>gv')

-- Reload all
nmap('<leader>ra', ':luafile $MYVIMRC<CR>')

-- Reload local
nmap('<leader>rl', ':luafile %<CR>')

-- Mapping Y to yank from current cursor position till end of line
nmap('Y', 'y$')

-- clear highlighted words
nmap('<leader><space>', ':noh<CR>')

-- Ctrl+L clear the highlight as well as redraw
nmap('<C-L>', ':nohls<CR><C-L>')

-- A trick for when you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts).
-- This lets you use w!! to do that after you opened the file already:
cmap('w!!', 'w !sudo tee % >/dev/null')

-- toggle comment
nmap('<Leader>c', ':TComment<CR>')
imap('<Leader>c', ':TComment<CR>')
vmap('<Leader>c', ':TComment<CR>')

-- Remove the Windows ^M - when the encodings gets messed up
nmap('<Leader>m', 'mmHmt:%s/<C-V><cr>//ge<cr>\'tzt\'m')

-- Add keyboard shortcuts for navigating splits
nmap('<C-down>', '<c-w>j')
nmap('<C-up>', '<c-w>k')
nmap('<C-right>', '<c-w>l')
nmap('<C-left>', '<c-w>h')

-- Move between tabs
nmap('<Tab>', 'gt')
nmap('<S-Tab>', 'gT')

-- fzf
nmap('<Leader>f', ':Files<CR>')
nmap('<Leader>b', ':Buffers<CR>')

-- puts debuggerer
-- https://tenderlovemaking.com/2016/02/05/i-am-a-puts-debuggerer.html :)
nmap('<Leader>pt', 'oputs \"#\" * 90<C-M>puts \"<C-R>=expand(\"%\") . \':\' . line(\".\")<CR>\"<C-M>puts \"#\" * 90<esc>')

-- upper/lower word
nmap('<leader>u', 'mQviwU`Q')
nmap('<leader>l', 'mQviwu`Q')

-- upper/lower first char of word
nmap('<leader>U', 'mQgewvU`Q')
nmap('<leader>L', 'mQgewvu`Q')

-- others
nmap('<leader>ew', ':e <C-R>=expand("%:p:h") . "/" <CR>')
nmap('<leader>es', ':sp <C-R>=expand("%:p:h") . "/" <CR>')
nmap('<leader>ev', ':vsp <C-R>=expand("%:p:h") . "/" <CR>')
nmap('<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>')
