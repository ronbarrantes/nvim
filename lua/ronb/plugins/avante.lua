return {
	"yetone/avante.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = { file_types = { "markdown", "Avante" } },
			ft = { "markdown", "Avante" },
		},
	},
	build = "make",
	opts = {
		provider = "ollama", -- change from "copilot" to "ollama"
		model = "qwen2.5-coder:7b", -- specify your Ollama model here
		url = "http://127.0.0.1:11434", -- optional, if needed for Ollama endpoint
	},
}
