require('nvim-treesitter.configs').setup({
  ensure_installed = { 'ruby', 'javascript', 'vim', 'rust', 'yaml', 'lua', 'markdown' },
  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
})

vim.treesitter.language.register('markdown', 'mdx')
