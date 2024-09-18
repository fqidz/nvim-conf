local map = vim.keymap.set
local opts = { noremap = true, silent = true }
--help set_keymap

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Expand/contract splits
map("n", "<A-,>", "<C-w>3>", opts)
map("n", "<A-.>", "<C-w>3<", opts)
map("n", "<A-u>", "<C-w>-", opts)
map("n", "<A-d>", "<C-w>+", opts)

-- Remove highlight
map("n", "<Esc>", "<Cmd>noh<CR>", opts)

-- Close current buffer
map("n", "<Leader>x", "<Cmd>bd<CR>", opts)

-- Save session
map("n", "<Leader>ss", "<Cmd>mksession! ~/.session.vim<CR>")

-- Load session
map("n", "<Leader>sl", "<Cmd>source ~/.session.vim<CR>")
