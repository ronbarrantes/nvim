return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			-- NEW STUFF
			log_level = vim.log.levels.DEBUG,
			formatters = {
				prettier_custom = {
					command = "npx",
					args = {
						"prettier",
						"--stdin-filepath",
						"$FILENAME",
					},
					stdin = true,
					cwd = require("conform.util").root_file({
						".prettierrc",
						"package.json",
						".git",
					}),
				},
			},
			-- END NEW STUFF
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				c = { "clang-format" }, -- Ensure clang-format is set for C files
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
