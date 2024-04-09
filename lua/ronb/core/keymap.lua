vim.g.mapleader = " "

local keymap = vim.keymap 

-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>fv", vim.cmd.Ex, { desc = "File View" })



-- OLD KEYMAPS 


-- vim.keymap.set("n", "<leader>u", "UndotreeShow<CR>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Visual Line Down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Visual Line Up" })

vim.keymap.set("n", "Y", "yg$", { desc = "yank from the cursor to the end of the line" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "joins current line with next, cursor at end" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scrolls down half screen, cursor at top" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scrolls up half screen, cursor at top" })
vim.keymap.set("n", "n", "nzzzv", { desc = "moves to next search match, center cursor vertically, enters visual mode" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "moves to previous search match, centers cursor vertically, enters visual mode" })

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "Q", "<nop>", { desc = "Something awful"})

-- vim.keymap.set("n", "<C-/>", ":Commentary<CR>")
-- vim.keymap.set("v", "<C-/>", ":Commentary<CR>")
-- vim.keymap.set("x", "<C-/>", ":Commentary<CR>")
-- vim.keymap.set("i", "<C-/>", "<Esc>:Commentary<CR>i", { noremap = true, silent = true })

-- -- vim.keymap.set('x', '<Tab>', '>gv', { noremap = true, silent = true })
-- vim.keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })
-- -- vim.keymap.set('x', '<S-Tab>', '<gv', { noremap = true, silent = true })
-- vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })

-- for opening terminal
-- vim.keymap.set("n", "<C-`>", ":terminal<CR>", { noremap = true, silent = true })

-- disables the arrow keys in normal mode
-- -- vim.keymap.set("n", "<Left>", ':echoe "Use h"<CR>')
-- -- vim.keymap.set("n", "<Right>", ':echoe "Use l"<CR>')
-- -- vim.keymap.set("n", "<Up>", ':echoe "Use k"<CR>')
-- -- vim.keymap.set("n", "<Down>", ':echoe "Use j"<CR>')

-- disables the arrows during insert mode
-- -- vim.keymap.set("i", "<Left>", '<ESC>:echoe "Use h"<CR>')
-- -- vim.keymap.set("i", "<Right>", '<ESC>:echoe "Use l"<CR>')
-- -- vim.keymap.set("i", "<Up>", '<ESC>:echoe "Use k"<CR>')
-- -- vim.keymap.set("i", "<Down>", '<ESC>:echoe "Use j"<CR>')

