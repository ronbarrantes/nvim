return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		local bg = "#030303" -- "#010618"
		local bg_dark = "#010413"
		local bg_highlight = "#042642"
		local bg_search = "#0A65AC"
		local bg_visual = "#274378"
		local fg = "#CBD0E0"
		local fg_dark = "#B4C0D9"
		local fg_gutter = "#627E97"
		local border = "#547998"

		require("tokyonight").setup({
			style = "night",

			on_colors = function(colors)
				colors.bg = bg
				colors.bg_dark = bg_dark
				colors.bg_float = bg_dark
				colors.bg_highlight = bg_highlight
				colors.bg_search = bg_search
				colors.bg_popup = bg_dark
				colors.bg_statusline = bg_dark
				colors.bg_visual = bg_visual
				colors.border = border
				colors.fg = fg
				colors.fg_dark = fg_dark
				colors.fg_float = fg
				colors.fg_gutter = fg_gutter
				colors.fg_sidebar = fg_dark
			end,
			on_highlights = function(highlights)
				highlights.Comment = { fg = "#A5A300", italic = true }
				highlights.LspDiagnosticsVirtualTextUnused = { fg = "#808080", italic = true } -- Gray and italic for unused variables
			end,
		})

		-- Set the colorscheme
		vim.cmd("colorscheme tokyonight")
	end,
}
