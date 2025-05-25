return {
	"williamboman/mason.nvim",
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					-- "tsserver",
					-- "html",
					-- "htmx",
					-- "jsonls",
					-- "cssls",
					-- "autotools_ls",
					-- "tailwindcss",
					-- "asm_lsp",
					-- "gopls",
					-- "golangci_lint_ls",
					-- "graphql",
					-- "emmet_ls",
					-- "marksman",
					-- "sqlls",
					-- "prismals",
					-- "pyright",
				},
				automatic_installation = true,
			},
		},
	},
}
