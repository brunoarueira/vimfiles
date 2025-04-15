return {
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
