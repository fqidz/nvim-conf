vim.opt.number = true
vim.opt.relativenumber = true
-- vim.lsp.inlay_hint.enable()

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.fillchars = { eob = " " }

vim.opt.inccommand = "split"

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 8

vim.opt.termguicolors = true

vim.opt.ignorecase = true

vim.g.mapleader = " "

vim.opt.signcolumn = "yes";

vim.diagnostic.config({
  update_in_insert = true;
})

