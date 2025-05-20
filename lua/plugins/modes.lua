return {
    'mvllow/modes.nvim', -- Improve modes exhibition
    event = 'VeryLazy',
    tag = 'v0.2.1',
    config = function()
        require('modes').setup()
    end,
}
