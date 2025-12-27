return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		-- capabilities for autocompletion
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- diagnostic symbols
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		-- global keymaps and server-specific logic on LspAttach
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				local opts = { buffer = ev.buf, silent = true }

				-- Global keymaps
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "CopilotChat"
				keymap.set({ "n", "v" }, "<leader>cc", vim.cmd.CopilotChatToggle, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

				-- Server-specific logic (replaces deprecated on_attach)
				if client and client.name == "svelte" then
					vim.api.nvim_create_autocmd("BufWritePost", {
						buffer = ev.buf,
						pattern = { "*.js", "*.ts" },
						callback = function(ctx)
							client:notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
						end,
					})
				end
			end,
		})

		-- setup mason-lspconfig handlers
		mason_lspconfig.setup_handlers({
			-- default handler
			function(server_name)
				vim.lsp.config(server_name, {
					capabilities = capabilities,
				})
				vim.lsp.enable(server_name)
			end,

			-- svelte
			["svelte"] = function()
				vim.lsp.config("svelte", {
					capabilities = capabilities,
				})
				vim.lsp.enable("svelte")
			end,

			-- graphql
			["graphql"] = function()
				vim.lsp.config("graphql", {
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
				vim.lsp.enable("graphql")
			end,

			-- emmet
			["emmet_ls"] = function()
				vim.lsp.config("emmet_ls", {
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
				vim.lsp.enable("emmet_ls")
			end,

			-- lua
			["lua_ls"] = function()
				vim.lsp.config("lua_ls", {
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							completion = { callSnippet = "Replace" },
						},
					},
				})
				vim.lsp.enable("lua_ls")
			end,
		})

		-- define htmx manually (custom server)
		vim.lsp.config("htmx", {
			cmd = { vim.fn.expand("~/.cargo/bin/htmx-lsp") },
			filetypes = { "html", "templ" },
			root_dir = function(fname)
				return vim.fs.dirname(fname) or vim.fn.getcwd()
			end,
		})
		vim.lsp.enable("htmx")
	end,
}
