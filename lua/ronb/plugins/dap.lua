return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"mfussenegger/nvim-dap-python",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()
		require("nvim-dap-virtual-text").setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- JavaScript, TypeScript, React, and Next.js
		local js_filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		}
		local js_debug_adapter = vim.fn.exepath("js-debug-adapter")
		if js_debug_adapter == "" then
			js_debug_adapter = "js-debug-adapter"
		end

		for _, adapter_type in ipairs({ "node", "chrome", "msedge" }) do
			local pwa_type = "pwa-" .. adapter_type
			dap.adapters[pwa_type] = {
				type = "server",
				host = "127.0.0.1",
				port = "${port}",
				executable = {
					command = js_debug_adapter,
					args = { "${port}" },
				},
			}
		end

		local js_configurations = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch current file",
				program = "${file}",
				cwd = "${workspaceFolder}",
				sourceMaps = true,
				skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
				resolveSourceMapLocations = {
					"${workspaceFolder}/**",
					"!**/node_modules/**",
				},
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to Node process",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
				sourceMaps = true,
				skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
				resolveSourceMapLocations = {
					"${workspaceFolder}/**",
					"!**/node_modules/**",
				},
			},
			{
				type = "pwa-chrome",
				request = "launch",
				name = "Launch Chrome at localhost:3000",
				url = "http://localhost:3000",
				webRoot = "${workspaceFolder}",
				sourceMaps = true,
			},
		}

		for _, filetype in ipairs(js_filetypes) do
			dap.configurations[filetype] = vim.deepcopy(js_configurations)
		end

		local vscode = require("dap.ext.vscode")
		vscode.type_to_filetypes["pwa-node"] = js_filetypes
		vscode.type_to_filetypes["pwa-chrome"] = js_filetypes
		vscode.type_to_filetypes["pwa-msedge"] = js_filetypes

		-- C and C++
		local codelldb_adapter = vim.fn.exepath("codelldb")
		if codelldb_adapter == "" then
			codelldb_adapter = "codelldb"
		end
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = codelldb_adapter,
				args = { "--port", "${port}" },
			},
		}

		local cpp_configurations = {
			{
				name = "Launch executable",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = false,
			},
		}
		dap.configurations.c = cpp_configurations
		dap.configurations.cpp = cpp_configurations

		-- Python
		local debugpy_adapter = vim.fn.exepath("debugpy-adapter")
		if debugpy_adapter == "" then
			debugpy_adapter = "debugpy-adapter"
		end
		require("dap-python").setup(debugpy_adapter)

		-- Go
		require("dap-go").setup()

		vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP start or continue" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP step over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP step into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP step out" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
		vim.keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "DAP conditional breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP start or continue" })
		vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP run last" })
		vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP open REPL" })
		vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP terminate" })
		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP toggle UI" })
	end,
}
