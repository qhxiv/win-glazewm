vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local set = vim.keymap.set

set("n", "<leader>e", vim.cmd.Ex)
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "J", "mzJ`z")

set("i", "<C-c>", "<Esc>")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
