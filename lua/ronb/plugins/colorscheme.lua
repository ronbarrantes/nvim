return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		local function get_system_theme()
			local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
			if handle == nil then
				return "light" -- Default to light theme if handle is nil
			end
			local result = handle:read("*a")
			handle:close()
			if result == nil then
				return "light" -- Default to light theme if result is nil
			end
			return result:match("Dark") and "dark" or "light"
		end

		local theme = get_system_theme()
		local bg = theme == "dark" and "#030303" or "#FFFFFF"
		local bg_dark = theme == "dark" and "#010413" or "#F0F0F0"
		local bg_highlight = theme == "dark" and "#042642" or "#E0E0E0"
		local bg_search = theme == "dark" and "#0A65AC" or "#D0D0D0"
		local bg_visual = theme == "dark" and "#274378" or "#C0C0C0"
		local fg = theme == "dark" and "#CBD0E0" or "#000000"
		local fg_dark = theme == "dark" and "#B4C0D9" or "#333333"
		local fg_gutter = theme == "dark" and "#627E97" or "#666666"
		local border = theme == "dark" and "#547998" or "#999999"

		require("tokyonight").setup({
			style = theme == "dark" and "night" or "day",
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
				highlights.Comment = { fg = "#457547", italic = true }
				highlights.LspDiagnosticsVirtualTextUnused = { fg = "#808080", italic = true } -- Gray and italic for unused variables
			end,
		})

		-- Set the colorscheme
		vim.cmd("colorscheme tokyonight")
	end,
}
