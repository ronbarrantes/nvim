local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
