-- Function to strip trailing whitespaces
local function strip_trailing_whitespaces()
    -- Preparation: save last search and cursor position.
    local old_search = vim.fn.getreg '/'
    local old_cursor = vim.api.nvim_win_get_cursor(0) -- 0 for current window

    -- Do the business: Use vim.cmd for the substitution
    -- Need double backslashes in Lua strings for single backslashes in Vim regex
    vim.cmd '%s/\\s\\+$//e'

    -- Clean up: restore previous search history and cursor position
    vim.fn.setreg('/', old_search)
    vim.api.nvim_win_set_cursor(0, old_cursor)
end

-- Function to collapse multiple blank lines into a single blank line
local function collapse_multiple_blank_lines()
    -- Use vim.cmd to execute the global command
    -- Need double backslashes for Lua strings
    vim.cmd 'g/^\\_$\\n\\_^$/d'
    -- Restore cursor position to avoid jumping
    vim.cmd 'normal! \'\''
end

-- Define User Commands
-- FormatJSON command
vim.api.nvim_create_user_command('FormatJSON', '%!jq \'.\'', {
    desc = 'Format current buffer with jq',
    range = '%', -- Allows specifying range like :%FormatJSON
})

-- Define Mappings
local map = vim.keymap.set
local leader = vim.g.mapleader or '\\' -- Use existing mapleader or default to backslash

-- Strip trailing whitespaces mappings
map({ 'n', 'i', 'c' }, leader .. '=', strip_trailing_whitespaces, { desc = 'Strip trailing whitespace' })
map('n', '<F5>', strip_trailing_whitespaces, { silent = true, desc = 'Strip trailing whitespace' })

-- Collapse blank lines mappings
map({ 'n', 'i', 'c' }, leader .. '-', collapse_multiple_blank_lines, { desc = 'Collapse multiple blank lines' })

-- Define Autocommands
-- Automatically remove whitespaces while saving files
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = strip_trailing_whitespaces,
    desc = 'Strip trailing whitespace before saving',
})
