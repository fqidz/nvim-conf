-- https://github.com/romgrk/barbar.nvim?tab=readme-ov-file#options

vim.g.barbar_auto_setup = false

require("barbar").setup({
    animation = false,
    autohide = 1,
})


-- Mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-I>', '<C-I>', opts)
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
