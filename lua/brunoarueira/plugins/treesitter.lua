-- Configure Treesitter
require('nvim-treesitter.configs').setup({
  -- Language servers
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
    'toml',
    'typescript',
    'vim',
    'yaml',
    'go',
  },

  -- Instalation settings
  sync_install = false,
  auto_install = false,

  -- Syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

      if ok and stats and stats.size > max_filesize then
        return true
      end
    end
  },

  -- Indentation
  indent = {
    enable = true,
  },

  -- Auto-pairing
  endwise = {
    enable = true,
  },

  -- Incremental selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    },
  },

  -- Code folding
  fold = {
    enable = true,
  },

  -- Auto tag completion
  autotag = {
    enable = true,
  }
})

-- Register markdown parser for MDX files
vim.treesitter.language.register('markdown', 'mdx')

-- Folding settings
local opt = vim.opt
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false
opt.foldlevel = 99

-- Performance settings
opt.maxmempattern = 10000 -- Increase max memory for pattern matching
