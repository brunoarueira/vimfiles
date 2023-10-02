require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'ruby', 'javascript', 'vim', 'rust', 'yaml', 'lua', 'markdown', 'markdown_inline', 'bash'
  },
  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  endwise = { enable = true }
})

vim.treesitter.language.register('markdown', 'mdx')

vim.cmd [[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
  set nofoldenable
]]
