---@class Ollama.Config
local OllamaConfig = {}

return {
	"nomnivore/ollama.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
	keys = {
		-- Open general Ollama prompt (chat)
		{
			"<leader>oo",
			function()
				-- Ensure current buffer is modifiable before prompting
				if vim.bo.modifiable then
					require("ollama").prompt()
				else
					vim.notify("Cannot use Ollama in a non-modifiable buffer", vim.log.levels.WARN)
				end
			end,
			desc = "Ollama Chat Prompt",
			mode = { "n", "v" },
		},
		-- Generate/refactor code prompt
		{
			"<leader>or",
			function()
				if vim.bo.modifiable then
					require("ollama").prompt("Refactor_Code")
				else
					vim.notify("Cannot use Ollama in a non-modifiable buffer", vim.log.levels.WARN)
				end
			end,
			desc = "Ollama Refactor Code",
			mode = { "n", "v" },
		},
		-- Explain code prompt
		{
			"<leader>oe",
			function()
				-- Explain_Code uses display action, so it should work from any buffer
				require("ollama").prompt("Explain_Code")
			end,
			desc = "Ollama Explain Code",
			mode = { "n", "v" },
		},
		-- Generate tests prompt
		{
			"<leader>ot",
			function()
				-- Generate_Tests uses display action, so it should work from any buffer
				require("ollama").prompt("Generate_Tests")
			end,
			desc = "Ollama Generate Tests",
			mode = { "n", "v" },
		},
	},
	config = function(_, opts)
		require("ollama").setup(opts)
		
		-- Fix for "Buffer is not modifiable" error
		-- Wrap ollama's util.set_lines function to ensure buffers are modifiable
		local ollama_util = require("ollama.util")
		if ollama_util and ollama_util.set_lines then
			local original_set_lines = ollama_util.set_lines
			ollama_util.set_lines = function(bufnr, start_idx, end_idx, lines, strict_indexing)
				-- Ensure buffer is modifiable before setting lines
				if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
					local modifiable = vim.api.nvim_buf_get_option(bufnr, "modifiable")
					if not modifiable then
						vim.api.nvim_buf_set_option(bufnr, "modifiable", true)
					end
				end
				return original_set_lines(bufnr, start_idx, end_idx, lines, strict_indexing)
			end
		end
		
		-- Also ensure ollama display buffers are modifiable when created
		vim.api.nvim_create_autocmd({ "BufNew", "BufWinEnter", "BufEnter" }, {
			pattern = "*",
			callback = function()
				local buf = vim.api.nvim_get_current_buf()
				if vim.api.nvim_buf_is_valid(buf) then
					local buf_name = vim.api.nvim_buf_get_name(buf)
					local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
					-- Check if this is an ollama buffer or might be used by ollama
					if buf_name:match("ollama") or filetype == "ollama" then
						vim.api.nvim_buf_set_option(buf, "modifiable", true)
					end
				end
			end,
		})
	end,
	opts = {
		-- Models
		model = "qwen2.5-coder:3b", -- general chat model
		model_code = "qwen2.5-coder:3b", -- coding-specific model (can be same)
		url = "http://127.0.0.1:11434",
		
		-- Context length limits (reduce from 16k to avoid memory pressure on 8GB RAM)
		-- You can adjust these based on your needs
		num_ctx = 4096, -- 4k context instead of 16k (reduces memory usage)
		-- num_predict = 512, -- limit response length if needed

		-- Automatically start Ollama server when Neovim opens
		serve = {
			on_start = true,
			command = "ollama",
			args = { "serve" },
			stop_command = "pkill",
			stop_args = { "-SIGTERM", "ollama" },
		},

		-- Request timeout (milliseconds) - increased for larger contexts
		request_timeout = 30000, -- 30 seconds timeout (increased from 15s)

		-- Prompts
		prompts = {
			Refactor_Code = {
				prompt = [[
You are a senior software engineer.

Here is the code snippet:
$input

Please refactor this code to improve readability and maintain behavior. Provide the updated code only.
        ]],
				input_label = "> ",
				model = "qwen2.5-coder:3b",
				action = "replace",
				num_ctx = 4096, -- Limit context for this prompt
			},
			Explain_Code = {
				prompt = [[
You are a helpful assistant.

Explain what this code does:
$input
        ]],
				input_label = "> ",
				model = "qwen2.5-coder:3b",
				action = "display",
				num_ctx = 4096, -- Limit context for this prompt
			},
			Generate_Tests = {
				prompt = [[
You are a test engineer.

Write unit tests for this code:
$input
        ]],
				input_label = "> ",
				model = "qwen2.5-coder:3b",
				action = "display",
				num_ctx = 4096, -- Limit context for this prompt
			},
			Sample_Prompt = {
				prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
				input_label = "> ",
				model = "qwen2.5-coder:3b",
				action = "display",
			},
		},
	},
}
