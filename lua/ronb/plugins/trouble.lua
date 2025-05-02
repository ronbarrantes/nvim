return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
		{ "<leader>xt", "<cmd>TodoTrouble toggle<CR>", desc = "Open todos in trouble" },
	},
}

-- return {
-- 	"folke/trouble.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
-- 	keys = {
-- 		{ "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
-- 		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
-- 		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
-- 		{ "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
-- 		{ "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
-- 		{ "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
-- 	},
-- }

-- return {
-- 	"folke/trouble.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
-- 	config = function()
-- 		require("trouble").setup({
-- 			-- you can customize here
-- 			use_diagnostic_signs = true,
-- 		})
-- 	end,
-- 	keys = {
-- 		{ "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Toggle Trouble" },
-- 		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics" },
-- 		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics" },
-- 		{ "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Quickfix List" },
-- 		{ "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Location List" },
-- 		{ "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Todo Comments" },
-- 	},
-- }
