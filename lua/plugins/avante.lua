return {
    {
        'yetone/avante.nvim',
        branch = 'main',
        run = 'make',
        version = false,
        dependencies = {
            -- Required plugins
            { 'nvim-lua/plenary.nvim' },
            { 'MunifTanjim/nui.nvim' },

            -- Optional dependencies
            { 'nvim-telescope/telescope.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'nvim-tree/nvim-web-devicons' },
            { 'nvim-treesitter/nvim-treesitter' },
            { 'stevearc/dressing.nvim' },
            {
                'HakonHarnes/img-clip.nvim',
                event = 'VeryLazy',
                opts = {
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                    },
                },
            },
            {
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { 'markdown', 'Avante' },
                },
                ft = { 'markdown', 'Avante' },
            },
        },
        opts = {
            provider = 'gemini',

            gemini = {
                model = 'gemini-2.5-pro',
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
