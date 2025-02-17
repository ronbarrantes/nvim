-- vim.cmd("let g:netrw_liststyle = 3")
-- vim.o.mouse = "" -- remove mouse support

local opt = vim.opt

vim.g.copilot_enabled = false

-- Remove mouse support
opt.mouse = ""
opt.eol = true

-- Ensure end of line character at the end of files
vim.opt.fixendofline = true

-- Set file format to Unix
opt.fileformat = "unix"

-- Autocmd to ensure newline at end of file
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	command = [[if &fixendofline | call setline('$', substitute(getline('$'), '\n\+$', '', '')) | endif]],
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.opt.fixendofline = true
-- 	end,
-- })

opt.relativenumber = true
opt.number = true

opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for shift width
opt.softtabstop = 2
opt.expandtab = true -- expand tabs to spaces
opt.autoindent = true -- copy line from current line when starting a new one

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
-- opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"

opt.backspace = "indent,eol,start"
-- opt.clipboard:append("unnamedplus") -- use system clipboard

-- split window
opt.splitright = true
opt.splitbelow = true
