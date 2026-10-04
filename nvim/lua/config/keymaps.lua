local map = vim.keymap.set

-- Save / quit
map("n", "<leader>w", "<cmd>write<cr>", {
    desc = "Save file",
})

map("n", "<leader>q", "<cmd>quit<cr>", {
    desc = "Quit window",
})

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Navigate splits
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize splits
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Keep selection after indentation
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move selected text
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

-- Buffer navigation
map("n", "<S-l>", "<cmd>bnext<cr>", {
    desc = "Next buffer",
})

map("n", "<S-h>", "<cmd>bprevious<cr>", {
    desc = "Previous buffer",
})

-- Terminal
map("n", "<leader>tt", "<cmd>terminal<cr>", {
    desc = "Terminal",
})

map("t", "<Esc><Esc>", "<C-\\><C-n>", {
    desc = "Exit terminal mode",
})
