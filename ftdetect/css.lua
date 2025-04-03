vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	pattern = {
		"*.scss",
		"*.less",
	},
	callback = function()
		vim.bo.filetype = 'css'
	end
})
