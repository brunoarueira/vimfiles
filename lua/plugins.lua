local status, packer = pcall(require, 'packer')

if (not status) then
  print('Packer is not installed')

  return
end

vim.cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

return packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'

    use 'ervandew/supertab'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
        require('brunoarueira.plugins.lualine')
      end
    }

    use {
      'tpope/vim-eunuch',
      cmd = { 'Rename', 'Delete' }
    }
    use 'godlygeek/tabular'
    use 'tomtom/tlib_vim'
    use 'MarcWeber/vim-addon-mw-utils'

    use { 'rstacruz/sparkup', rtp = 'vim/' }

    use 'scrooloose/nerdtree'
    use 'tomtom/tcomment_vim'
    use 'tpope/vim-abolish'
    use 'tpope/vim-git'
    -- use 'tpope/vim-rails'
    use 'vim-ruby/vim-ruby'
    use 'vim-scripts/gitignore'
    use 'bogado/file-line'
    use 'terryma/vim-multiple-cursors'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'victormours/ruby-memoize.vim'
    use 'mattn/emmet-vim'
    use 'editorconfig/editorconfig-vim'

    use {
      'NvChad/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup()
      end
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
      requires = {
        'RRethy/nvim-treesitter-endwise'
      },
      config = function()
        require('brunoarueira.plugins.treesitter')
      end
    }

    use 'arcticicestudio/nord-vim'
    use 'rust-lang/rust.vim'

    -- JSON front matter highlight use
    use 'elzr/vim-json'
    use {
      'ellisonleao/glow.nvim',
      config = function()
        require('glow').setup()
      end
    }
    use {
      'lukas-reineke/headlines.nvim',
      after = 'nvim-treesitter',
      ft = { 'markdown' },
      config = function()
        require('brunoarueira.plugins.headline')
      end
    }

    use 'nvim-lua/plenary.nvim'

    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
        -- LSP Support
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'neovim/nvim-lspconfig' },
        { 'onsails/lspkind-nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-path' },
        { 'L3MON4D3/LuaSnip' },
      },
      config = function()
        require('brunoarueira.plugins.lsp')
      end
    }
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    }
  }
})
