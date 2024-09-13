local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-A-n>", "<Cmd>!cargo run<CR>", opts)

