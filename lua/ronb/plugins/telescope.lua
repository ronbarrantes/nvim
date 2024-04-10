
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  {"nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {"nvim-tree/nvim-web-devicons"},
  config = function() 
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
        defaults = {
        file_ignore_patterns = {
          "node_modules"
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      },
      pickers = {
      },
      extensions = {
      }
    })

    telescope.load_extension("fzf")
    local keymap = vim.keymap
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc="Find in files"})




  end
}
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find in file" })
-- vim.keymap.set('n', '<C-f>', builtin.git_files, { desc = "Find in git files" })
-- vim.keymap.set('n', '<leader>fs', function()
--   builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end, { desc = "Find string"}
-- )

