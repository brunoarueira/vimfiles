vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = "*.scss",
  callback = function()
    vim.bo.filetype = 'css'
  end
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = "*.less",
  callback = function()
    vim.bo.filetype = 'css'
  end
})
