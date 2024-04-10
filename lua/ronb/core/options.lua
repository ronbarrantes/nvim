-- vim.cmd("let g:netrw_liststyle = 3")
vim.o.mouse = "" -- remove mouse support

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for shift width
opt.softtabstop = 2
opt.expandtab = true -- expand tabs to spaces
opt.autoindent = true -- copy line from current line when starting a new one

opt.smartindent = true

opt.wrap = false

-- opt.swapfile = false
-- opt.backup = false
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- opt.undofile = true

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

