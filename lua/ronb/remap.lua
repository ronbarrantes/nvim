vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>u", "UndotreeShow<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-/>", ":Commentary<CR>")
vim.keymap.set("v", "<C-/>", ":Commentary<CR>")
vim.keymap.set("x", "<C-/>", ":Commentary<CR>")
vim.keymap.set("i", "<C-/>", "<Esc>:Commentary<CR>i", { noremap = true, silent = true })

-- vim.keymap.set('x', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('n', '<Tab>', '>>', { noremap = true, silent = true })
-- vim.keymap.set('x', '<S-Tab>', '<gv', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<<', { noremap = true, silent = true })

-- for opening terminal
vim.keymap.set('n', "<C-`>", ":terminal<CR>", { noremap = true, silent = true })

-- disables the arrow keys in normal mode
vim.keymap.set("n", "<Left>", ':echoe "Use h"<CR>')
vim.keymap.set("n", "<Right>", ':echoe "Use l"<CR>')
vim.keymap.set("n", "<Up>", ':echoe "Use k"<CR>')
vim.keymap.set("n", "<Down>", ':echoe "Use j"<CR>')

-- disables the arrows during insert mode
vim.keymap.set("i", "<Left>", '<ESC>:echoe "Use h"<CR>')
vim.keymap.set("i", "<Right>", '<ESC>:echoe "Use l"<CR>')
vim.keymap.set("i", "<Up>", '<ESC>:echoe "Use k"<CR>')
vim.keymap.set("i", "<Down>", '<ESC>:echoe "Use j"<CR>')
