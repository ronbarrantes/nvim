local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Prefer `vim.uv` (Neovim 0.10+). Avoid `vim.loop` dot-access which triggers
-- deprecation diagnostics in newer Neovim/LuaLS; `vim["loop"]` keeps older
-- versions working without the warning.
local uv = vim.uv or vim["loop"]
if not uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- TODO: move this to a different file

-- -- Enable mouse support
-- vim.o.mouse = "a"

-- -- Confine mouse scrolling to the current buffer
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	pattern = "*",
-- 	command = "set mouse=a",
-- })

require("lazy").setup({
	spec = {
		{ import = "ronb.plugins" },
		{ import = "ronb.plugins.lsp" },
	},
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	version = false,
})
