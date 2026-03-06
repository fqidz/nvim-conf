local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-s>", "<Cmd>TypstPreview<CR>", opts)
