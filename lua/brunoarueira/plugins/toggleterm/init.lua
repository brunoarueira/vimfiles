local status, toggleterm = pcall(require, 'toggleterm')

if (not status) then
  return
end

toggleterm.setup({
  close_on_exit = true,
  hide_numbers = true,
  insert_mappings = true,
  open_mapping = [[<c-\>]],
  persist_size = false,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  shell = nil,
  size = 20,
  start_in_insert = true,
})

local terminal = require('toggleterm.terminal').Terminal

vim.cmd([[
  augroup terminal_setup | au!
  autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
  autocmd TermEnter * startinsert!
  augroup end
]])

vim.api.nvim_create_autocmd(
  { 'TermEnter' },
  {
    pattern = { '*' },
    callback = function ()
      vim.cmd 'startinsert'

      _G.set_terminal_keymaps()
    end,
  }
)

local opts = { noremap = true, silent = true }

function _G.set_terminal_keymaps()
  vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
end

