vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = "*.lua",
  callback = function()
    vim.bo.filetype = 'lua'
  end
})
