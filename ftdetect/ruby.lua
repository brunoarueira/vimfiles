-- Detect Ruby filetype for Gemfiles and Fastfiles
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"*gemfile*", -- Matches Gemfile, gemfile, Gemfile.lock, etc.
		"*.gemfile", -- Matches files ending with .gemfile
		"*Fastfile", -- Matches Fastfile
	},
	callback = function()
		vim.bo.filetype = 'ruby'
	end
})
