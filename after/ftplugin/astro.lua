-- Set syntax for astro files
vim.bo.syntax = "astro"

-- Optional: You could also use an autocmd if you prefer,
-- though setting buffer options directly in ftplugin is often simpler.
-- Example using autocmd (generally not needed here):
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.astro",
--   command = "setlocal syntax=astro",
-- })
