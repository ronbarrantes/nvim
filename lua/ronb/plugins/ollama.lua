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
			":<c-u>lua require('ollama').prompt()<cr>",
			desc = "Ollama Chat Prompt",
			mode = { "n", "v" },
		},
		-- Generate/refactor code prompt
		{
			"<leader>or",
			":<c-u>lua require('ollama').prompt('Refactor_Code')<cr>",
			desc = "Ollama Refactor Code",
			mode = { "n", "v" },
		},
		-- Explain code prompt
		{
			"<leader>oe",
			":<c-u>lua require('ollama').prompt('Explain_Code')<cr>",
			desc = "Ollama Explain Code",
			mode = { "n", "v" },
		},
		-- Generate tests prompt
		{
			"<leader>ot",
			":<c-u>lua require('ollama').prompt('Generate_Tests')<cr>",
			desc = "Ollama Generate Tests",
			mode = { "n", "v" },
		},
	},
	opts = {
		-- Models
		model = "qwen2.5-coder:3b", -- general chat model
		model_code = "qwen2.5-coder:3b", -- coding-specific model (can be same)
		url = "http://127.0.0.1:11434",

		-- Automatically start Ollama server when Neovim opens
		serve = {
			on_start = true,
			command = "ollama",
			args = { "serve" },
			stop_command = "pkill",
			stop_args = { "-SIGTERM", "ollama" },
		},

		-- Request timeout (milliseconds)
		request_timeout = 15000, -- 15 seconds timeout

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
