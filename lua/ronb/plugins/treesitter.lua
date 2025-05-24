return {
	"nvim-treesitter/nvim-treesitter",

	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	opts = {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		-- List of parsers to ignore installing (or "all")
		ignore_install = { "javascript" },

		---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
		-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

		highlight = {
			enable = true,

			-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
			-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
			-- the name of the parser)
			-- list of language that will be disabled
			disable = { "c", "rust" },
			-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},
	},
}
-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	build = ":TSUpdate",
-- 	dependencies = {
-- 		"windwp/nvim-ts-autotag",
-- 	},
-- 	config = function()
-- 		-- import nvim-treesitter plugin
-- 		local treesitter = require("nvim-treesitter.configs")

-- 		-- configure treesitter
-- 		treesitter.setup({ -- enable syntax highlighting
-- 			highlight = {
-- 				enable = true,
-- 			},

-- 			--      sync_install = false,
-- 			auto_install = true,
-- 			-- enable indentation
-- 			indent = { enable = true },
-- 			-- enable autotagging (w/ nvim-ts-autotag plugin)
-- 			autotag = {
-- 				enable = true,
-- 			},
-- 			--      additional_vim_regex_highlighting = false,
-- 			-- ensure these language parsers are installed
-- 			-- Using this option may slow down your editor, and you may see some duplicate
-- 			-- Instead of true it can also be a list of languages
-- 			--       additional_vim_regex_highlighting = false,
-- 			ensure_installed = {
-- 				-- "json",
-- 				-- "zig",
-- 				-- "rust",
-- 				-- "sql",
-- 				-- "asm",
-- 				-- "comment",
-- 				-- "templ",
-- 				-- "make",
-- 				-- "llvm",
-- 				-- "javascript",
-- 				-- "http",
-- 				-- "csv",
-- 				-- "cuda",
-- 				-- "cmake",
-- 				-- "typescript",
-- 				-- "tsx",
-- 				-- "yaml",
-- 				-- "html",
-- 				-- "css",
-- 				-- "prisma",
-- 				-- "markdown",
-- 				-- "markdown_inline",
-- 				-- "go",
-- 				-- "svelte",
-- 				-- "graphql",
-- 				-- "bash",
-- 				-- "lua",
-- 				-- "vim",
-- 				-- "dockerfile",
-- 				-- "gitignore",
-- 				-- "query",
-- 				-- "vimdoc",
-- 				-- "c",
-- 			},
-- 			incremental_selection = {
-- 				enable = true,
-- 				keymaps = {
-- 					init_selection = "<C-space>",
-- 					node_incremental = "<C-space>",
-- 					scope_incremental = false,
-- 					node_decremental = "<bs>",
-- 				},
-- 			},
-- 		})
-- 	end,
-- }

-- use {
--   'neovim/nvim-lspconfig',
--   'williamboman/mason.nvim',
--   'williamboman/mason-lspconfig.nvim',
--   'nvim-treesitter/nvim-treesitter',
--   'nvim-treesitter/nvim-treesitter-refactor',
--   'nvim-treesitter/nvim-treesitter-textobjects'
-- }

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     virtual_text = {
--       spacing = 4,
--       prefix = '~',
--     },
--     signs = true,
--     update_in_insert = false,
--   }
-- )

-- vim.cmd [[
--   highlight LspDiagnosticsUnused guifg=#ff0000 gui=underline
-- ]]

-- require'nvim-treesitter.configs'.setup {
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false,
--   },
--   refactor = {
--     highlight_definitions = { enable = true },
--     highlight_current_scope = { enable = true },
--   },
--   textobjects = {
--     select = {
--       enable = true,
--       lookahead = true,
--       keymaps = {
--         ["af"] = "@function.outer",
--         ["if"] = "@function.inner",
--         ["ac"] = "@class.outer",
--         ["ic"] = "@class.inner",
--       },
--     },
--   },
-- }

-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "maintained", -- Install all maintained parsers
--   sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
--   ignore_install = { "javascript" }, -- List of parsers to ignore installing

--   highlight = {
--     enable = true, -- false will disable the whole extension
--     disable = { "c", "rust" }, -- List of languages to disable
--     additional_vim_regex_highlighting = false,
--   },

--   refactor = {
--     highlight_definitions = { enable = true },
--     highlight_current_scope = { enable = true },
--   },

--   textobjects = {
--     select = {
--       enable = true,
--       lookahead = true,
--       keymaps = {
--         ["af"] = "@function.outer",
--         ["if"] = "@function.inner",
--         ["ac"] = "@class.outer",
--         ["ic"] = "@class.inner",
--       },
--     },
--   },
-- }
