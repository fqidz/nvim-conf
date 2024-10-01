vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Leader>da", vim.diagnostic.open_float , opts)

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
vim.api.nvim_clear_autocmds({ group = augroup })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    vim.lsp.buf.format()
  end,
})
