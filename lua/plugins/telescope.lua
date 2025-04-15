return {
    {
        'nvim-telescope/telescope.nvim',
        event = 'VeryLazy',
        config = function()
            local _, actions = require 'telescope.actions'
            local fb_actions = require('telescope').extensions.file_browser.actions

            require('telescope').setup {
                defaults = {
                    layout_strategy = 'flex',
                    layout_config = {
                        horizontal = {
                            prompt_position = 'top',
                            height = 0.9,
                        },
                        vertical = {
                            prompt_position = 'top',
                        },
                    },
                    sorting_strategy = 'ascending',
                    prompt_prefix = ' ',
                    file_ignore_patterns = { '.*.git/.*', 'node_modules/.*' },
                    mappings = {
                        i = {
                            ['<C-e>'] = function(picker)
                                actions.send_selected_to_qflist(picker)

                                vim.cmd 'copen'
                            end,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                    git_files = {
                        show_untracked = true,
                    },
                },
                extensions = {
                    egrepify = {
                        filename_hl = '@attribute',
                        lnum_hl = 'LineNr',
                    },
                    fzy_native = {
                        override_generic_sorter = true,
                        override_file_sorter = true,
                    },
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                    },
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown {},
                    },
                    file_browser = {
                        hidden = true,
                        prompt_path = true,
                        hide_parent_dir = true,
                        grouped = true,
                        mappings = {
                            ['i'] = {
                                ['<C-d>'] = fb_actions.remove,
                                ['<C-v>'] = fb_actions.copy,
                                ['<C-x>'] = fb_actions.move,
                                ['<C-space>'] = fb_actions.create_from_prompt,
                                ['<C-r>'] = fb_actions.rename,
                                ['<C-b>'] = fb_actions.goto_cwd,
                                ['<C-w>'] = function()
                                    vim.cmd 'normal vbd'
                                end,
                            },
                            ['n'] = {
                                ['<C-d>'] = fb_actions.remove,
                                ['<C-v>'] = fb_actions.copy,
                                ['<C-x>'] = fb_actions.move,
                                ['<C-space>'] = fb_actions.create_from_prompt,
                                ['<C-r>'] = fb_actions.rename,
                                ['<C-b>'] = fb_actions.goto_cwd,
                            },
                        },
                    },
                },
            }

            require('telescope').load_extension 'yank_history'
            require('telescope').load_extension 'ui-select'
            require('telescope').load_extension 'file_browser'
            require('telescope').load_extension 'fzf'
            require('telescope').load_extension 'egrepify'

            local builtin = require 'telescope.builtin'

            vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>s', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
        end,
        dependencies = {
            'nvim-telescope/telescope-ui-select.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'fdschmidt93/telescope-egrepify.nvim',
            'nvim-lua/plenary.nvim',
            {
                'gbprod/yanky.nvim',
                config = function()
                    local mapping = require 'yanky.telescope.mapping'
                    local utils = require 'yanky.utils'
                    local _, actions = pcall(require, 'telescope.actions')

                    require('yanky').setup {
                        ring = {
                            history_length = 50,
                            storage = 'shada',
                            sync_with_numbered_registers = true,
                        },
                        preserve_cursor_position = {
                            enabled = true,
                        },
                        picker = {
                            telescope = {
                                mappings = {
                                    default = mapping.put 'p',
                                    i = {
                                        ['<C-p>'] = actions.move_selection_previous,
                                        ['<C-n>'] = actions.move_selection_next,
                                        ['<c-k>'] = mapping.put 'P',
                                        ['<c-x>'] = mapping.delete(),
                                        ['<c-r>'] = mapping.set_register '+',
                                    },
                                    n = {
                                        p = mapping.put 'p',
                                        P = mapping.put 'P',
                                        d = mapping.delete(),
                                        r = mapping.set_register(utils.get_default_register()),
                                    },
                                },
                            },
                        },
                    }

                    vim.api.nvim_set_keymap('n', 'p', '<Plug>(YankyPutAfter)', {})
                    vim.api.nvim_set_keymap('n', 'P', '<Plug>(YankyPutBefore)', {})
                    vim.api.nvim_set_keymap('x', 'p', '<Plug>(YankyPutAfter)', {})
                    vim.api.nvim_set_keymap('x', 'P', '<Plug>(YankyPutBefore)', {})

                    vim.api.nvim_set_keymap('n', 'y', '<Plug>(YankyYank)', {})
                    vim.api.nvim_set_keymap('x', 'y', '<Plug>(YankyYank)', {})

                    vim.api.nvim_set_keymap('n', '<c-p>', '<Plug>(YankyCycleForward)', {})
                    vim.api.nvim_set_keymap('n', '<c-n>', '<Plug>(YankyCycleBackward)', {})
                end,
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
            },
        },
    },
}
