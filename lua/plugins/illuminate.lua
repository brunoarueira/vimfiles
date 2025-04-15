return {
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
}
