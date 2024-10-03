vim.opt.conceallevel = 1

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Leader>mp", "<Cmd>MarkdownPreview<CR>", opts)
