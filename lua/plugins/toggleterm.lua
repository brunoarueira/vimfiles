local function configure_terminal_keymaps()
	local term_opts = { noremap = true, silent = true, buffer = 0 }

	-- Navigation
	vim.keymap.set("t", "<m-h>", [[<C-\><C-n><C-W>h]], term_opts)
	vim.keymap.set("t", "<m-j>", [[<C-\><C-n><C-W>j]], term_opts)
	vim.keymap.set("t", "<m-k>", [[<C-\><C-n><C-W>k]], term_opts)
	vim.keymap.set("t", "<m-l>", [[<C-\><C-n><C-W>l]], term_opts)

	-- Additional terminal controls
	vim.keymap.set("t", "<m-[>", [[<C-\><C-n>]], term_opts)         -- Exit terminal mode
	vim.keymap.set("t", "<c-w>", [[<C-\><C-n><C-w>]], term_opts)    -- Window commands
	vim.keymap.set("t", "<m-q>", [[<C-\><C-n>:ToggleTerm<CR>]], term_opts) -- Window commands
end

-- Autocommands for terminal behavior
vim.api.nvim_create_augroup("TerminalBehavior", { clear = true })

vim.api.nvim_create_autocmd({ "TermOpen" }, {
	group = "TerminalBehavior",
	pattern = "term://*",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"

		vim.cmd("startinsert")
	end,
})

vim.api.nvim_create_autocmd({ "TermEnter" }, {
	group = "TerminalBehavior",
	pattern = "*",
	callback = function()
		vim.cmd("startinsert")

		configure_terminal_keymaps()
	end,
})

-- Main terminal configuration
return {
	"akinsho/toggleterm.nvim",
	branch = "main",
	opts = {
		-- Appearance
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		shade_terminals = true,
		shading_factor = 2,
		float_opts = {
			border = "curved",
			winblend = 3,
		},

		-- Behavior
		close_on_exit = true,
		hide_numbers = true,
		insert_mappings = true,
		open_mapping = [[<c-\>]],
		persist_size = true,
		persist_mode = true,
		start_in_insert = true,

		-- Shell configuration
		shell = vim.o.shell,
		auto_scroll = true,
		direction = "float", -- "vertical" | "horizontal" | "tab" | "float"
	}
}
