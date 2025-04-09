-- Lua translation of filetypes.vimrc

-- Helper function to set local options
local function set_local_options(filetypes, options)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function()
            for option, value in pairs(options) do
                vim.opt_local[option] = value
            end
        end,
    })
end

-- CSS, HTML, Ruby, ERB, YAML, SQL, JSON, Lua, JavaScript, TypeScript, TypeScriptReact, Astro
set_local_options({
    'css',
    'html',
    'ruby',
    'eruby',
    'yaml',
    'sql',
    'json',
    'javascript',
    'typescript',
    'typescriptreact',
    'astro',
}, {
    shiftwidth = 2,
    tabstop = 2,
    expandtab = true,
})

-- SQL
set_local_options({ 'sql' }, {
    formatoptions = 'croqnl1',
    foldmethod = 'indent',
    foldlevel = 1,
})

-- Go
set_local_options({ 'go' }, {
    shiftwidth = 8,
    tabstop = 8,
    expandtab = true,
})

-- Git Commit
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'gitcommit',
    callback = function()
        vim.api.nvim_command 'call setpos(\'.\', [0, 1, 1, 0])'
    end,
})

-- Markdown
set_local_options({ 'md' }, {
    textwidth = 80,
})
