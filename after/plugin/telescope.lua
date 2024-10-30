local builtin = require('telescope.builtin')
local telescope = require("telescope")
local actions = require("telescope.actions")
vim.g.leadermap = " "
-- set keymaps
local keymap = vim.keymap -- for conciseness
local builtin = require('telescope.builtin')
--
--vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files"})
--vim.keymap.set('n', '<C-g>', builtin.find_files, { desc = "Find Git Files"})
--
--vim.keymap.set('n', '<leader>fs', function() 
--  builtin.grep_string({ search = vim.fn.input("Grep > ")})
--end, { desc = "Search"})
--
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--
--

-- require('telescope').load_extension('fzf')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find in file" })
keymap.set('n', '<leader>fs', 
function()
builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, 
{ desc = "Find string" }
)
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find in git files" }) 

telescope.setup {
  defaults = {
    path_display = {"smart"},
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous, -- move to prev result
          ["<C-j>"] = actions.move_selection_next, -- move to next result
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        },
      },
    file_ignore_patterns = {
      "node_modules"
    }
  }
}
