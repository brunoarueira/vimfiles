-- Settings

-- Backspace behavior
vim.o.backspace = "indent,eol,start"

-- Whichwrap
vim.o.whichwrap = "<,>,h,l"

-- Identation
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftround = true

-- Display incomplete commands
vim.o.showcmd = true

-- Regular expressions
vim.o.magic = true

-- Bracket matching blink time
vim.o.mat = 2

-- No annoying sound on errors
vim.o.errorbells = false
vim.o.visualbell = true
vim.cmd [[set t_vb = ""]]
vim.o.tm = 500

-- Improve vim's scrolling speed
vim.o.ttyfast = true
vim.o.lazyredraw = true

-- Use Unix as the standard file type
vim.o.ffs = "unix,dos,mac"

-- Wildmenu settings
vim.o.wildmode = "longest,list"
vim.o.wildmenu = true

-- Wildignore settings (Disable output and VCS files)
vim.o.wildignore = vim.o.wildignore .. ",*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem"

-- Ignore images and log files
vim.o.wildignore = vim.o.wildignore .. ",*.gif,*.jpg,*.png,*.log"

-- Disable archive files
vim.o.wildignore = vim.o.wildignore .. ",*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz"

-- Ignore bundler and sass cache
vim.o.wildignore = vim.o.wildignore .. ",*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*"

-- Ignore rails temporary asset caches
vim.o.wildignore = vim.o.wildignore .. ",*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*"

-- Disable temp and backup files
vim.o.wildignore = vim.o.wildignore .. ",*.swp,*~,._*"

-- Disable osx index files
vim.o.wildignore = vim.o.wildignore .. ",.DS_Store"

-- Yanks go on clipboard instead.
vim.o.clipboard = "unnamed,unnamedplus"

-- History size
vim.o.history = 256

-- Autowrite
vim.o.autowrite = true

-- Ruler
vim.o.ruler = true

-- Line numbers
vim.o.nu = true

-- Line wrapping
vim.o.wrap = true

-- Ignore case in searches
vim.o.ignorecase = true

-- Open splits at right side (and below)
vim.o.splitright = true
vim.o.splitbelow = true

-- Disable swap/backup file
vim.o.backup = false
vim.o.wb = false
vim.o.swapfile = false

-- Text width and format options
vim.o.textwidth = 79
vim.o.formatoptions = "qrn1"

-- Timeout settings
vim.cmd("set notimeout")
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Encoding
if not vim.g.neovim then
  vim.cmd("set encoding=utf-8 nobomb")
end

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.v.oldfiles and vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})

-- Remember info about open buffers on close
vim.cmd("set viminfo ^=%")

-- Project Specific vimrc
-- =================================

vim.o.exrc = true
vim.o.secure = true

-- Syntax Highlighting
-- ================================

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ".psqlrc",
  callback = function()
    vim.o.filetype = "sql"
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "bash_profile",
  callback = function()
    vim.o.filetype = "sh"
  end,
})

-- Creates parent directories on save
local function MkNonExDir(file, buf)
  if vim.bo[buf].buftype == "" and not string.match(file, "^%w+:/") then
    local dir = vim.fn.fnamemodify(file, ":h")
    if not vim.fn.isdirectory(dir) then
      vim.fn.mkdir(dir, "p")
    end
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    MkNonExDir(vim.fn.expand("<afile>"), vim.fn.expand("<abuf>"))
  end,
})

-- Change program used by :grep
vim.o.grepprg = "rg --vimgrep --smart-case --follow"

-- Do not source the default filetypes.vim
vim.cmd [[set updatetime=300]]

local g, opt = vim.g, vim.opt

g.mapleader = ","

opt.shell = 'fish'
opt.shellquote = ''
opt.shellxquote = ''

g.do_filetype_lua = 1
g.did_load_filetypes = 0
