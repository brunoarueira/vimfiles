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

    use {
      'NvChad/nvim-colorizer.lua',
      config = function ()
        require('colorizer').setup()
      end
    }

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
      end
    }

    use 'arcticicestudio/nord-vim'
    use 'rust-lang/rust.vim'

    -- JSON front matter highlight use
    use 'elzr/vim-json'
    use 'plasticboy/vim-markdown'

    use 'nvim-lua/plenary.nvim'

    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'L3MON4D3/LuaSnip' },
      },
      config = function ()
        local lsp = require('lsp-zero')

        require('lspconfig.configs')

        local lspconfig = require('lspconfig')

        local servers = {
          'efm',
          'eslint',
          'lua_ls',
          'solargraph',
          'tsserver',
          'yamlls',
          'vale_ls',
          'rust_analyzer'
        }

        lsp.preset('recommended')

        lsp.set_sign_icons({
          error = "",
          warn = "",
          hint = "",
          info = " ",
        })

        lsp.ensure_installed(servers)

        lsp.set_server_config({
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
        })

        lsp.format_mapping("gq", {
          format_opts = {
            async = false,
            timeout_ms = 10000,
          },
          servers = {
            ["efm"] = {
              "css",
              "fish",
              "html",
              "lua",
              "javascript",
              "json",
              "typescript",
              "yaml",
              "rubocop"
            },
            ["solargraph"] = { "ruby" },
            ["rubocop"] = { "ruby" },
          },
        })

        lsp.on_attach(function(client, bufnr)
          local opts = { buffer = bufnr, remap = false }

          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

          if client.name == "efm" then
            client.server_capabilities.documentFormattingProvider = true
            client.server_capabilities.documentFormattinngRangeProvider = true
          end
        end)

        lsp.setup()

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        for _, server in ipairs(servers) do
          lspconfig[server].setup {
            -- on_attach = my_custom_on_attach,
            capabilities = capabilities,
          }
        end

        lspconfig.vale_ls.setup({
          filetypes = { 'markdown', 'mdx' }
        })

        lspconfig.solargraph.setup({
          cmd = { 'bundle', 'exec', 'solargraph', 'stdio' },
          capabilities = capabilities
        })

        -- lspconfig.rubocop.setup({
        --   cmd = { 'bundle', 'exec', 'rubocop', '--lsp' },
        --   capabilities = capabilities
        -- })

        vim.lsp.set_log_level("debug")
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
