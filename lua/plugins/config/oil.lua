local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require("oil").setup()

map("n", "-", "<Cmd>Oil<CR>", opts)
