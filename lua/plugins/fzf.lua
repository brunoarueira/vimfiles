return {
  "junegunn/fzf",
  {
    "junegunn/fzf.vim",
    config = function()
      vim.cmd [[
        " hide status and ruler for cleaner fzf windows
        if has('nvim')
          au FileType fzf set laststatus& laststatus=0 | au BufLeave <buffer> set laststatus&
        endif
      ]]
    end
  }
}
