-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

local packer = require('packer')

packer.init({
  git = {
    clone_timeout = 300
  },
  profile = {
    enable = true
  }
})

return packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'

    use 'nathom/filetype.nvim'

    use 'ervandew/supertab'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require('brunoarueira.plugins.lualine')
      end
    }

    use 'danro/rename.vim'
    use 'godlygeek/tabular'
    use 'gorkunov/smartpairs.vim'
    use 'tomtom/tlib_vim'
    use 'MarcWeber/vim-addon-mw-utils'
    use 'int3/vim-extradite'

    use { 'rstacruz/sparkup', rtp = 'vim/' }

    use 'scrooloose/nerdtree'
    use 'ap/vim-css-color'
    use 'tomtom/tcomment_vim'
    use 'tpope/vim-abolish'
    use 'tpope/vim-endwise'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-git'
    use 'tpope/vim-rails'
    use 'vim-ruby/vim-ruby'
    use 'vim-scripts/gitignore'
    use 'bogado/file-line'
    use 'terryma/vim-multiple-cursors'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'victormours/ruby-memoize.vim'
    use 'mattn/emmet-vim'
    use 'w0rp/ale'

    use {
      'sourcegraph/javascript-typescript-langserver',
      ft = 'javascript',
      run = 'npm install && npm run build'
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require('nvim-treesitter.configs').setup({
          ensure_installed = { 'ruby', 'javascript', 'vim', 'rust', 'yaml', 'lua' },
          highlight = {
            enable = true,

            additional_vim_regex_highlighting = false,
          },
          indent = {
            enable = true
          }
        })
      end
    }

    use 'arcticicestudio/nord-vim'
    use 'rust-lang/rust.vim'

    -- JSON front matter highlight use
    use 'elzr/vim-json'
    use 'plasticboy/vim-markdown'
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = single })
      end,
    }
  }
})
