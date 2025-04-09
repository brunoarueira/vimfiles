return {
    'ervandew/supertab',

    { 'tpope/vim-eunuch', cmd = { 'Rename', 'Delete' } },
    'godlygeek/tabular',
    'tomtom/tlib_vim',
    'MarcWeber/vim-addon-mw-utils',

    'scrooloose/nerdtree',
    'tomtom/tcomment_vim',
    'tpope/vim-abolish',
    'tpope/vim-git',
    -- "tpope/vim-rails",
    'vim-ruby/vim-ruby',
    'vim-scripts/gitignore',
    'bogado/file-line',
    'terryma/vim-multiple-cursors',
    'victormours/ruby-memoize.vim',
    'editorconfig/editorconfig-vim',

    {
        'RRethy/vim-illuminate',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            delay = 200,
            filetypes_denylist = {
                'dirbuf',
                'dirvish',
                'fugitive',
                'NvimTree',
            },
        },
        config = function(_, opts)
            require('illuminate').configure(opts)

            vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'Visual' })
            vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })
            vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'Visual' })
        end,
    },

    'NvChad/nvim-colorizer.lua',

    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = function()
            require('gitsigns').setup()
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },

    {
        'ray-x/go.nvim',
        dependencies = {
            'ray-x/guihua.lua',
        },
        ft = { 'go', 'gomod' },
        run = ':lua require(\'go.install\').update_all_sync()',
    },

    {
        'windwp/nvim-ts-autotag',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        event = 'InsertEnter',
    },

    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('nordic').load()
        end,
    },
    'rust-lang/rust.vim',

    -- JSON front matter highlight use
    'elzr/vim-json',
    'ellisonleao/glow.nvim',

    'nvim-lua/plenary.nvim',

    {
        'pmizio/typescript-tools.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    },

    {
        'akinsho/git-conflict.nvim',
        branch = 'main',
    },

    'wuelnerdotexe/vim-astro',

    {
        'yetone/avante.nvim',
        branch = 'main',
        run = 'make',
        dependencies = {
            -- Required plugins
            { 'nvim-treesitter/nvim-treesitter' },
            { 'stevearc/dressing.nvim' },
            { 'nvim-lua/plenary.nvim' },
            { 'MunifTanjim/nui.nvim' },
            { 'MeanderingProgrammer/render-markdown.nvim' },

            -- Optional dependencies
            { 'hrsh7th/nvim-cmp' },
            { 'nvim-tree/nvim-web-devicons' },
            { 'HakonHarnes/img-clip.nvim' },
        },
        opts = {
            provider = 'gemini',

            gemini = {
                model = 'gemini-2.5-pro-exp-03-25',
                temperature = 0,
                max_tokens = 4096,
            },

            behaviour = {
                auto_suggestions = false, -- Experimental stage
                auto_set_highlight_group = true,
                auto_set_keymaps = true,
                auto_apply_diff_after_generation = false,
                support_paste_from_clipboard = false,
            },
        },
    },
}
