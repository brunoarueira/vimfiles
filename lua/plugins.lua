local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
    use {
      'mattn/emmet-vim',
      config = function()
        vim.cmd([[
          let g:user_emmet_install_global = 0

          autocmd FileType html,css EmmetInstall
        ]])
      end
    }

    use 'editorconfig/editorconfig-vim'

    use {
      'RRethy/vim-illuminate',
      config = function()
        require('illuminate')

        vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
      end
    }

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
      'ray-x/go.nvim',
      requires = {
        'ray-x/guihua.lua'
      },
      config = function()
        require('go').setup()
      end,
      ft = { 'go', 'gomod' },
      run = ":lua require('go.install').update_all_sync()"
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

    use {
      'akinsho/toggleterm.nvim',
      tag = '*',
      config = function()
        require('brunoarueira.plugins.toggleterm')
      end
    }

    use { 'akinsho/git-conflict.nvim', tag = "*", config = function()
      require('git-conflict').setup()
    end }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      packer.sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    }
  }
})
