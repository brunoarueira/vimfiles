-- This file lists plugins managed by lazy.nvim
-- For more details, see: https://github.com/folke/lazy.nvim

return {
    -- =========================================================================
    -- == Core / Utility ==
    -- =========================================================================
    'tomtom/tlib_vim', -- Required by tabular
    'MarcWeber/vim-addon-mw-utils', -- Required by tabular
    'editorconfig/editorconfig-vim', -- Maintain consistent coding styles

    -- =========================================================================
    -- == UI / Appearance ==
    -- =========================================================================
    {
        'AlexvZyl/nordic.nvim', -- Theme
        lazy = false,
        priority = 1000,
        config = function()
            require('nordic').load()
        end,
    },
    'NvChad/nvim-colorizer.lua', -- Display colors based on their codes
    'ellisonleao/glow.nvim', -- Markdown preview

    -- =========================================================================
    -- == File Management / Navigation ==
    -- =========================================================================
    'scrooloose/nerdtree', -- File explorer
    { 'tpope/vim-eunuch', cmd = { 'Rename', 'Delete' } }, -- Unix commands for file manipulation

    -- =========================================================================
    -- == Editing Enhancements ==
    -- =========================================================================
    'ervandew/supertab', -- Context-aware completion
    'godlygeek/tabular', -- Text alignment
    'tomtom/tcomment_vim', -- Code commenting
    'tpope/vim-abolish', -- Smart abbreviations and substitutions
    'bogado/file-line', -- Go to file:line quickly
    'terryma/vim-multiple-cursors', -- Multiple cursors support
    'jgdavey/vim-blockle', -- Convert ruby block formats
    'folke/snacks.nvim', -- A collection of QoL plugins for Neovim

    -- =========================================================================
    -- == Git Integration ==
    -- =========================================================================
    'tpope/vim-git', -- Basic Git commands and integration
    'vim-scripts/gitignore', -- Gitignore file syntax and support
    {
        'lewis6991/gitsigns.nvim', -- Git decorations in the sign column
        event = 'VeryLazy',
        config = function()
            require('gitsigns').setup()
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },

    {
        'akinsho/git-conflict.nvim', -- Git conflict resolution helper
        branch = 'main',
        config = function()
            require('git-conflict').setup()
        end,
    },

    {
        'sindrets/diffview.nvim', -- Enhanced diff viewing
        cmd = {
            'DiffviewOpen',
            'DiffviewClose',
            'DiffviewFileHistory',
            'DiffviewFocusFiles',
            'DiffviewLog',
            'DiffviewRefresh',
            'DiffviewToggleFiles',
        },
        config = function()
            vim.keymap.set('n', '<leader>v', function()
                if next(require('diffview.lib').views) == nil then
                    vim.cmd 'DiffviewOpen'
                else
                    vim.cmd 'DiffviewClose'
                end
            end)
        end,
    },

    -- =========================================================================
    -- == Language Support / LSP / Treesitter ==
    -- =========================================================================
    'vim-ruby/vim-ruby', -- Ruby language support
    'victormours/ruby-memoize.vim', -- Ruby specific helper

    {
        'windwp/nvim-ts-autotag', -- Auto close/rename HTML/XML tags (requires Treesitter)
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        event = 'InsertEnter',
    },
    'rust-lang/rust.vim', -- Rust language support
    'elzr/vim-json', -- JSON syntax highlighting and support
    {
        'pmizio/typescript-tools.nvim', -- TypeScript tooling and LSP integration
        dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    },
    'wuelnerdotexe/vim-astro', -- Astro language support

    -- =========================================================================
    -- == Formatting / Linting ==
    -- =========================================================================
    {
        'stevearc/conform.nvim', -- Formatting framework
        opts = {
            format_on_save = {
                timeout_ns = 5000,
                lsp_format = 'fallback',
            },
            formatters_by_ft = {
                lua = { 'stylua' },
            },
        },
    },
}
