require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'dockerfile',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'ruby',
    'rust',
    'typescript',
    'vim',
    'yaml',
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
